module Docxtor2
  class Package::Document::TableOfContents
    TOC_HEADING_STYLE = "TOCHeading"
    TOC_PARAGRAPH_STYLE = "toc 1"

    def initialize(xml)
      xml.w :sdt, "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main" do |xml|

        xml.w :sdtPr do |xml|
          xml.w :docPartObj do |xml|
            xml.w :docPartGallery, "w:val" => "Table of Contents"
            xml.w :docPartUnique
          end
        end

        xml.w :sdtContent do |xml|
          
          xml.w :p do |xml|
            xml.w :pPr do |xml|
              xml.w :pStyle, "w:val" => TOC_PARAGRAPH_STYLE
            end
            xml.w :r do |xml|
              xml.w :t do |xml|
                xml.text! "Contents"
              end
            end
          end

          xml.w :p do |xml|
            xml.w :pPr do |xml|
              xml.w :pStyle, "w:val" => TOC_PARAGRAPH_STYLE
              xml.w :tabs do |xml|
                xml.w :tab, "w:val" => "right", "w:leader" => "dot", "w:pos" => 9350
              end
              xml.w :rPr do |xml|
                xml.w :noProof
              end
            end
            xml.w :r do |xml|
              xml.w :fldChar, "w:fldCharType" => "begin", "w:dirty" => true
            end
            xml.w :r do |xml|
              xml.w :instrText, "xml:space" => "preserve" do |xml|
                xml.text! " TOC \\o '1-3' \\h \\z \\u "
              end
            end
            xml.w :r do |xml|
              xml.w :fldChar, "w:fldCharType" => "separate"
            end
          end

          xml.w :p do |xml|
            xml.w :r do |xml|
              xml.w :rPr do |xml|
                xml.w :b
                xml.w :bCs
                xml.w :noProof
              end
              xml.w :fldChar, "w:fldCharType" => "end"
            end
          end

        end
      end
    end
  end
end