module Docxtor2
  class Package::Document::TableOfContents
    def initialize(xml)
      xml.w :sdt, "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main" do |xml|
        xml.w :sdtPr do |xml|
          xml.w :id, "w:val" => "1676794842"
          xml.w :docPartObj do |xml|
            xml.w :docPartGallery, "w:val" => "Table of Contents"
            xml.w :docPartUnique
          end
        end

        xml.w :sdtContent do |xml|
          xml.w :p do |xml|
            xml.w :pPr do |xml|
              xml.w :pStyle, "w:val" => "TOCHeading"
            end
            xml.w :r do |xml|
              xml.w :t do |xml|
                xml.text! "Contents"
              end
            end
          end
        end
      end
    end
  end
end