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
  autoload :DocumentBuilder, 'docxtor2/document_builder'
  autoload :ContentBuilder, 'docxtor2/content_builder'
  autoload :TemplateParser, 'docxtor2/template_parser'

  autoload :Package, 'docxtor2/package'
  class Package
    autoload :Part, 'docxtor2/package/part'
    autoload :Document, 'docxtor2/package/document'
    class Document
      autoload :Paragraph, 'docxtor2/package/document/paragraph'
    end
  end

  def self.generate(docx, template = Known::Templates::DEFAULT, &block)
    Generator.generate(docx, template, &block)
  end
end
