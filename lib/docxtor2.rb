require "docxtor2/version"

module Docxtor2
  autoload :Generator, 'docxtor2/generator'
  autoload :Builder, 'docxtor2/builder'
  autoload :TemplateParser, 'docxtor2/template_parser'

  module Model
    autoload :Document, 'docxtor2/model/document'
  end

  def self.generate(template, docx, &block)
    @document = Builder.build(template, &block)
    Generator.generate(docx, @document)
  end

  def self.document
    @document
  end
end
