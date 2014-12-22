require "sassunit/version"
require "commander"

module SassUnit
  class CLI
    include Commander::Methods

    def run
      configure_with_gemspec

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

    private

    def configure_with_gemspec
      program :name, gemspec.name
      program :version, gemspec.version.to_s
      program :description, gemspec.summary
    end

    def gemspec
      base_dir = Pathname.new("#{File.dirname(__FILE__)}")
      base_dir = base_dir.parent until path = Dir[base_dir + "*.gemspec"].first
      @gemspec ||= Gem::Specification.load(path)
    end
  end
end
