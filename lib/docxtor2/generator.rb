module Docxtor2
  class Generator
    class << self
      def generate(docx, template, &block)
        parts = TemplateParser.parse(template)
        document = DocumentBuilder.build(&block);
        package = Package.new(parts, document)

        Serializer.serialize(docx, package)
      end
    end
  end
end
