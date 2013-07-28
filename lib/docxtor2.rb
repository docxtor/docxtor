require "builder"
require "zip/zip"

require "docxtor2/constants"
require "docxtor2/known/parts"
require "docxtor2/known/path"
require "docxtor2/known/templates"
require "docxtor2/known/styles"
require "docxtor2/known/mappings"
require "docxtor2/known/aliases"

module Docxtor2
  autoload :Generator, 'docxtor2/generator'
  autoload :DocumentBuilder, 'docxtor2/document_builder'
  autoload :ContentBuilder, 'docxtor2/content_builder'
  autoload :TemplateParser, 'docxtor2/template_parser'
  autoload :Package, 'docxtor2/package'
  autoload :BlockEvaluator, 'docxtor2/block_evaluator'
  autoload :ObjectUtils, 'docxtor2/object_utils'
  autoload :ElementList, 'docxtor2/element_list'

  class Package
    autoload :Part, 'docxtor2/package/part'
    autoload :Document, 'docxtor2/package/document'
    class Document
      autoload :Element, 'docxtor2/package/document/element'
      autoload :Run, 'docxtor2/package/document/run'
      autoload :Text, 'docxtor2/package/document/text'
      autoload :TableOfContents, 'docxtor2/package/document/table_of_contents'
      autoload :Paragraph, 'docxtor2/package/document/paragraph'
      autoload :Heading, 'docxtor2/package/document/heading'
      autoload :PageBreak, 'docxtor2/package/document/page_break'
    end
  end

  def self.generate(template = Known::Templates::DEFAULT, &block)
    Generator.generate(template, &block)
  end
end
