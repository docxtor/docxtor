module Docxtor2
  class Generator
    class << self
      def generate(docx, template, &block)
        parts = TemplateParser.parse(template)
        xml = XmlBuilder.build(block)
        document = DocumentBuilder.build(parts, xml)
        
        Serializer.serialize(docx, document)
      end
    end
  end
end
