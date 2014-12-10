# SassUnit

A tiny Ruby utility for testing Sass libraries by comparing compiled output of short Sass tests to the expected CSS output.

For more information about the motivation and rationale behind SassUnit, read my [introductory article](http://rosspenman.com/testing-sass/), but, in short:

* Prevents old functionality being accidentally broken by new changes
* Easy to learn and use
* Can enforce testing with minimum supported version of Sass for your project
* Easy to use with continuous integration

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sassunit'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sassunit

## Usage

In your project’s root directory, create a folder called “test”. This is where your Sass test files live. Create a Sass file (classic Sass or SCSS) for each test, and for each Sass test file create a corresponding expected output file with the same name, but the “.css” extension.

### Examples

```sh
# run the tests for the current project directory
$ bundle exec sassunit

# run a single test in the current project
$ bundle exec sassunit test/first_test.scss

# run tests for another project
$ bundle exec sassunit ~/projects/another_project # do not include /test
```

Running SassUnit using `bundle exec` will ensure it uses the version of Sass defined in your project’s Gemfile. This can be useful for ensuring that tests still pass with the minimum supported Sass version for your project.

## Contributing

1. [Fork it](https://github.com/penman/sassunit/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

---

[You can follow me on Twitter.](https://twitter.com/PenmanRoss)
