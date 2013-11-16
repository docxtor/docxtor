require "builder"
require "zip/zip"

require "docxtor/version"

module Docxtor
  autoload :Generator, 'docxtor/generator'
  autoload :TemplateParser, 'docxtor/template_parser'
  autoload :RunningElementsBuilder, 'docxtor/running_elements_builder'
  autoload :RunningElement, 'docxtor/running_element'
  autoload :ReferenceBuilder, 'docxtor/reference_builder'

  module Document
    autoload :Builder, 'docxtor/document/builder'
    autoload :Element, 'docxtor/document/element'
    autoload :Root, 'docxtor/document/root'
    autoload :Run, 'docxtor/document/run'
    autoload :Text, 'docxtor/document/text'
    autoload :TableOfContents, 'docxtor/document/table_of_contents'
    autoload :Paragraph, 'docxtor/document/paragraph'
    autoload :Heading, 'docxtor/document/heading'
    autoload :PageBreak, 'docxtor/document/page_break'
  end

  module Package
    autoload :Part, 'docxtor/package/part'
    autoload :Builder, "docxtor/package/builder"
  end

  def self.generate(template = nil, &block)
    Generator.generate(template, &block)
  end
end
