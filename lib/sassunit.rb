require "sass"
require "minitest/spec"
require "sassunit/backtrace_filter"

MiniTest.backtrace_filter = SassUnit::BacktraceFilter.new

module SassUnit
  module_function

  def add_test(directory = ".", files: nil)
    Sass.load_paths << directory

    files ||= Dir.glob("#{directory}/test/**/*.s{a,c}ss")
    files.each do |file|

      describe file do
        it "compiles correctly" do
          expected_file = file.sub(/\.s[ac]ss/, ".css")

          [file, expected_file].each do |f|
            assert File.exists?(f), "#{f} does not exist"
          end

          compiled = Sass.compile(open(file).read, filename: file)
          # compile the CSS file as SCSS so it's formatted the same
          expected = Sass.compile(open(expected_file).read, filename: file)
          compiled.must_equal expected
        end
      end

    end
  end

  def run_tests
    MiniTest.run
  end
end
