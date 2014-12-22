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
          expected = file.sub(/\.s[ac]ss/, ".css")

          [file, expected].each do |f|
            assert File.exists?(f), "#{f} does not exist"
          end

          css = Sass.compile(open(file).read, filename: file)
          css.must_equal open(expected).read
        end
      end

    end
  end

  def run_tests
    MiniTest.run
  end
end
