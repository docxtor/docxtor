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
  autoload :XmlBuilder, 'docxtor2/xml_builder'
  autoload :DocumentBuilder, 'docxtor2/document_builder'
  autoload :TemplateParser, 'docxtor2/template_parser'
  module Model
    autoload :Node, 'docxtor2/model/node'
    autoload :Story, 'docxtor2/model/story'
    autoload :Document, 'docxtor2/model/document'
    class Document
      autoload :Part, 'docxtor2/model/document/part'
      autoload :Paragraph, 'docxtor2/model/document/paragraph'
    end
  end

  def self.generate(docx, template = Known::Templates::DEFAULT, &block)
    Generator.generate(docx, template, &block)
  end
end
