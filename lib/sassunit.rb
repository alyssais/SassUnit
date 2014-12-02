require "sass"
require "minitest/autorun"
require "minitest/spec"

require "sassunit/version"

module SassUnit
  module_function

  def test(directory = ".", files: nil)
    Sass.load_paths << directory

    files ||= Dir.glob("#{directory}/test/**/*.s{a,c}ss")
    files.each do |file|
      describe file do
        it "compiles correctly" do
          expected = file.sub(/\.s[ac]ss/, ".css")
          syntax = File.extname(file)[1..-1].to_sym
          css = Sass.compile(open(file).read, syntax: syntax, filename: file)
          css.must_equal open(expected).read
        end
      end
    end
  end
end
