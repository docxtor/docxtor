module Docxtor
  module Document
    class TableOfContents < Element
      STYLE = 'defprnRUSSelStyle'
      PARAGRAPH_STYLE = '10'

      def after_initialize(text)
        create_params({:style => STYLE})
        @text = text
      end

      # TODO: Add support for extended styling & properties

      def render(xml)
        super

        xml.w :sdt, "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main" do

          write_properties

          xml.w :sdtContent do

            write_heading

            xml.w :p do
              xml.w :pPr do
                xml.w :pStyle, "w:val" => PARAGRAPH_STYLE
                xml.w :tabs do
                  xml.w :tab, "w:val" => "right", "w:leader" => "dot", "w:pos" => 9350
                end
                xml.w :rPr do
                  xml.w :noProof
                end
              end
              xml.w :r do
                xml.w :fldChar, "w:fldCharType" => "begin", "w:dirty" => true
              end

              write_instruct

              xml.w :r do
                xml.w :fldChar, "w:fldCharType" => "separate"
              end
            end

            xml.w :p do
              xml.w :r do
                # xml.w :rPr do
                #   xml.w :b
                #   xml.w :bCs
                #   xml.w :noProof
                # end
                xml.w :fldChar, "w:fldCharType" => "end"
              end
            end

          end
        end
      end

      private

      def write_properties
        xml.w :sdtPr do
          xml.w :docPartObj do
            xml.w :docPartGallery, "w:val" => "Table of Contents"
            xml.w :docPartUnique
          end
        end
      end

      def write_heading
        xml.w :p do
          xml.w :pPr do
            xml.w :pStyle, "w:val" => @params[:style]
          end
          xml.w :r do
            xml.w :t do
              xml.text! @text
            end
          end
        end
      end

      def write_instruct
        xml.w :r do
          xml.w :instrText, "xml:space" => "preserve" do
            xml.text! " TOC \\o '1-3' \\h \\z \\u "
          end
        end
      end

    end
  end
end
