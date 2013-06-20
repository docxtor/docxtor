# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docxtor2/version'

Gem::Specification.new do |spec|
  spec.name          = "docxtor2"
  spec.version       = Docxtor2::VERSION
  spec.authors       = ["Vasiliy Yorkin"]
  spec.email         = ["vasiliy.yorin@gmail.com"]
  spec.description   = %q{Prawn-like ruby docx generator, provides its own DSL to simplify things}
  spec.summary       = %q{Ruby docx generator}
  spec.homepage      = "http://github.com/vyorkin/docxtor2"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "nokogiri", "~> 1.4.0"
  spec.add_runtime_dependency "builder"
  spec.add_runtime_dependency "rubytree"
  spec.add_runtime_dependency "rubyzip"
end
