
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "openai_error_handler/version"

Gem::Specification.new do |spec|
  spec.name          = "openai_error_handler"
  spec.version       = OpenaiErrorHandler::VERSION
  spec.authors       = ["Abhishek Verma"]
  spec.email         = ["nonuabi@gmail.com"]

  spec.summary       = %q{Custom error handler with OpenAI integration for Rails applications.}
  spec.description   = %q{Handle errors in a Rails application and integrate with OpenAI for solutions.}
  spec.homepage      = "https://github.com/nonuabi/openai_error_handler"
  spec.license       = "MIT"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "json", "~> 2.5"
  spec.add_runtime_dependency "net-http", "~> 0.1.1"
  spec.add_runtime_dependency "uri", "~> 0.10.0"
end
