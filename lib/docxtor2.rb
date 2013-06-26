require "docxtor2/version"
require "docxtor2/constants"
require "docxtor2/configus"

module Docxtor2
  autoload :Generator, 'docxtor2/generator'
  autoload :Builder, 'docxtor2/builder'
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

  def self.generate(template, docx, &block)
    @document = Builder.build(template, &block)
    Generator.generate(docx, @document)
  end

  def self.document
    @document
  end
end
