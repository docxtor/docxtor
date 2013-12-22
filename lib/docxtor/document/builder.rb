module Docxtor
  module Document
    class Builder
      attr_accessor :content, :running_elements

      def initialize(running_elements, &block)
        @running_elements = running_elements
        @content = render(&block)
      end

      def filename
        "word/document.xml"
      end

      def render(&block)
        xml = ::Builder::XmlMarkup.new

        xml.instruct! :xml, :version => "1.0", :encoding => "UTF-8", :standalone => "yes"
        xml.w :document, "xmlns:ve" => "http://schemas.openxmlformats.org/markup-compatibility/2006",
        "xmlns:o" => "urn:schemas-microsoft-com:office:office",
        "xmlns:r" => "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
        "xmlns:m" => "http://schemas.openxmlformats.org/officeDocument/2006/math",
        "xmlns:v" => "urn:schemas-microsoft-com:vml",
        "xmlns:wp" => "http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing",
        "xmlns:w10" => "urn:schemas-microsoft-com:office:word",
        "xmlns:w" => "http://schemas.openxmlformats.org/wordprocessingml/2006/main",
        "xmlns:wne" => "http://schemas.microsoft.com/office/word/2006/wordml" do
          xml.w :body do
            xml << Document::Root.new(&block).render(::Builder::XmlMarkup.new)

            render_running_elements xml
          end
        end

        xml.target!
      end

      def render_running_elements xml
        xml.w :sectPr do |xml|
          running_elements.each do |re|
            xml.w re.reference_name.to_sym, "r:id" => re.reference_id, "w:type" => "#{re.pages}"
          end
        end
      end
    end
  end
end
