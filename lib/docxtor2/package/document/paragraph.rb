module Docxtor2
  class Package::Document::Paragraph
    def initialize(xml, content, properties = '')
      xml.w :p do
        xml.w << properties
        xml.w :r do
          xml.w :t do
            xml << content
          end
        end
      end
    end
  end
end
