require "builder"
require "zip/zip"

require "docxtor2/version"

module Docxtor2
  autoload :Generator, 'docxtor2/generator'
  autoload :TemplateParser, 'docxtor2/template_parser'

  module Document
    autoload :Builder, 'docxtor2/document/builder'
    autoload :Element, 'docxtor2/document/element'
    autoload :Root, 'docxtor2/document/root'
    autoload :Run, 'docxtor2/document/run'
    autoload :Text, 'docxtor2/document/text'
    autoload :TableOfContents, 'docxtor2/document/table_of_contents'
    autoload :Paragraph, 'docxtor2/document/paragraph'
    autoload :Heading, 'docxtor2/document/heading'
    autoload :PageBreak, 'docxtor2/document/page_break'
  end

  module Package
    autoload :Part, 'docxtor2/package/part'
    autoload :Builder, "docxtor2/package/builder"
  end

  def self.generate(template = nil, &block)
    Generator.generate(template, &block)
  end
end
