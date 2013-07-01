module Docxtor2
  class Package::Document::Paragraph
    def initialize(xml, text)
      xml.w :p do
        xml.w :r do
          xml.w :t do
            xml.text! text
          end
        end
      end
    end
  end
end
