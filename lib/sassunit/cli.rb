require "sassunit/info"
require "commander"

module SassUnit
  class CLI
    include Commander::Methods

    def run
      program :name, SassUnit::NAME
      program :version, SassUnit::VERSION
      program :description, SassUnit::DESCRIPTION

      command :test do |c|
        c.description = "Tests specified Sass files"
        c.action do |args, options|
          require "sassunit"
          args[0] ||= "."
          args.each do |path|
            if Pathname.new(path).directory?
              SassUnit.add_test(path)
            else
              SassUnit.add_test(nil, files: [path])
            end
          end
          SassUnit.run_tests
        end
      end
      default_command :test

      run!
    end
  end
end
