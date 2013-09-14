module Docxtor2
  module Document
    class ContentBuilder < ElementList
      class << self
        def build(&block)
          instance = new(block)
          instance.build
        end
      end

      map({ :table_of_contents  => Document::TableOfContents,
            :p                  => Document::Paragraph,
            :h                  => Document::Heading,
            :page_break         => Document::PageBreak
          })

      def initialize(block)
        super()
        instance_eval &block
      end

      def build
        xml = ::Builder::XmlMarkup.new
        write_elements(xml)
        xml.target!
      end
    end
  end
end
