lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fortune/version'

Gem::Specification.new do |spec|
  spec.name          = "Fortune"
  spec.version       = Fortune::VERSION
  spec.authors       = ["wonderfulkasey"]
  spec.email         = ["wonderfulkasey@gmail.com"]

  spec.summary       = "A rubygem that can give you the Top 10 companies to work for."
  spec.homepage      = "https://github.com/wonderfulkasey/rubycliproject"
  spec.license       = "MIT"


  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'pry'
  spec.add_dependency 'httparty'
end
