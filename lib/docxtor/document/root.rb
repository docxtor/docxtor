module Docxtor
  module Document
    class Root < Element
      map({ :table_of_contents  => Document::TableOfContents,
            :p                  => Document::Paragraph,
            :h                  => Document::Heading,
            :page_break         => Document::PageBreak
          })

      def render(xml)
        super
        write_elements
        xml.target!
      end
    end
  end
end
