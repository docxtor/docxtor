module Docxtor2
  class Package::Document::Heading < Package::Document::Paragraph
    STYLE_PREFIX = "heading"

    def initialize(xml, content, nesting)
      super(xml, content, properties(nesting))
    end

    private

    def properties(nesting)
      result = ''
      xml = Builder::XmlMarkup.new(:target => result)
      xml.w :pPr do
        xml.w :pStyle, "w:val" => "#{STYLE_PREFIX} #{nesting}"
      end
      result
    end
  end
end