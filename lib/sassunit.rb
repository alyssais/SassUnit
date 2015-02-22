require "sass"
require "minitest/spec"
require "sassunit/backtrace_filter"

MiniTest.backtrace_filter = SassUnit::BacktraceFilter.new

module SassUnit
  module_function

  def add_test(directory = ".", files = nil)
    Sass.load_paths << directory

    files ||= Dir.glob("#{directory}/test/**/*.s{a,c}ss")
    files.each do |file|

      describe file do
        it "compiles correctly" do
          expected_file = file.sub(/\.s[ac]ss/, ".css")

          files_exist = [file, expected_file].inject(true) do |acc, file|
            acc && File.exists?(file)
          end

          return assert false, "expected files do not exist" unless files_exist

          opts = { filename: file, style: :compressed }
          compiled = Sass.compile(open(file).read, opts)
          # compile the CSS file as SCSS so it's formatted the same
          expected = Sass.compile(open(expected_file).read, opts)
          compiled.must_equal expected
        end
      end

    end
  end

  def run_tests
    MiniTest.run
  end
end
