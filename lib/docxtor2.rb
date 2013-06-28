require "builder"
require "zip"

require "docxtor2/version"
require "docxtor2/constants"
require "docxtor2/known/parts"
require "docxtor2/known/path"
require "docxtor2/known/templates"

module Docxtor2
  autoload :Generator, 'docxtor2/generator'
  autoload :Serializer, 'docxtor2/serializer'
  autoload :ContentBuilder, 'docxtor2/content_builder'
  autoload :TemplateParser, 'docxtor2/template_parser'

  module Model
    autoload :Package, 'docxtor2/model/package'
    class Package
      autoload :Part, 'docxtor2/model/package/part'
      autoload :Document, 'docxtor2/model/package/document'
    end
  end

  def self.generate(docx, template = Known::Templates::DEFAULT, &block)
    Generator.generate(docx, template, &block)
  end
end
