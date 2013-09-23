# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'docxtor/version'

Gem::Specification.new do |spec|
  spec.name          = "docxtor"
  spec.version       = Docxtor::VERSION
  spec.authors       = ["Irina Bednova, Vasiliy Yorkin"]
  spec.email         = ["howeveririna@gmail.com, vasiliy.yorkin@gmail.com"]
  spec.description   = %q{Ruby docx generator, provides simple DSL for building word documents}
  spec.summary       = %q{Ruby docx generator}
  spec.homepage      = "http://github.com/docxtor/docxtor"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  # HINT: Version lock is required for ruby ree-1.8.7
  spec.add_development_dependency "nokogiri", "~> 1.4.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-xml"
  spec.add_development_dependency "wrong"

  spec.add_runtime_dependency "builder"
  spec.add_runtime_dependency "rubytree"
  spec.add_runtime_dependency "rubyzip", "0.9.9"
end
