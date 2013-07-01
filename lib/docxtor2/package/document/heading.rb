module Docxtor2
  class Package::Document::Heading < Package::Document::Paragraph
    def initialize(xml, content, nesting)
      super(xml, content, properties(nesting))
    end

    private

    def properties(nesting)
      properties = ''
      xml = Builder::XmlMarkup.new(:target => properties)
      xml.w :pPr do
        xml.tag! :pStyle, "w:val" => "h#{nesting}"
      end
      properties
    end
  end
end