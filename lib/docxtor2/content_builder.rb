module Docxtor2
  class ContentBuilder < ElementList
    class << self
      def build(&block)
        instance = new(block)
        instance.build
      end
    end

    map({ :table_of_contents  => Package::Document::TableOfContents,
          :p                  => Package::Document::Paragraph,
          :h                  => Package::Document::Heading,
          :page_break         => Package::Document::PageBreak
        })

    def initialize(block)
      super()
      instance_eval &block
    end

    def build
      xml = Builder::XmlMarkup.new
      write_elements(xml)
      xml.target!
    end
  end
end
