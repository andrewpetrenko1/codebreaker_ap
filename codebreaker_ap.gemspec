lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "codebreaker_ap/version"

Gem::Specification.new do |spec|
  spec.name          = "codebreaker_ap"
  spec.version       = CodebreakerAp::VERSION
  spec.authors       = ["andrewpetrenko1"]
  spec.email         = ["andreypetrenko1998@gmail.com"]

  spec.summary       = 'Codebreaker game'
  spec.description   = 'Codebreaker is a logic game in which a code-breaker tries to break a secret code.'
  spec.homepage      = 'https://github.com/andrewpetrenko1/codebreaker_ap'

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'i18n'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
