require "builder"
require "zip/zip"

require "docxtor2/version"

require "docxtor2/known/parts"
require "docxtor2/known/path"
require "docxtor2/known/styles"
require "docxtor2/known/mappings"

module Docxtor2
  autoload :Generator, 'docxtor2/generator'
  autoload :ContentBuilder, 'docxtor2/content_builder'
  autoload :TemplateParser, 'docxtor2/template_parser'
  autoload :ElementList, 'docxtor2/element_list'
  autoload :PackageBuilder, "docxtor2/package_builder"

  module Package
    autoload :Part, 'docxtor2/package/part'
    autoload :DocumentBuilder, 'docxtor2/package/document_builder'
    module Document
      autoload :Element, 'docxtor2/package/document/element'
      autoload :Run, 'docxtor2/package/document/run'
      autoload :Text, 'docxtor2/package/document/text'
      autoload :TableOfContents, 'docxtor2/package/document/table_of_contents'
      autoload :Paragraph, 'docxtor2/package/document/paragraph'
      autoload :Heading, 'docxtor2/package/document/heading'
      autoload :PageBreak, 'docxtor2/package/document/page_break'
    end
  end

  def self.generate(template = nil, &block)
    Generator.generate(template, &block)
  end
end
