module Docxtor2
  class Generator
    class << self
      def generate(docx, template, &block)
        parts = TemplateParser.parse(template)
        content = ContentBuilder.build(&block)

        document = Model::Package::Document.new(DOCUMENT_XML_PATH, content)
        package = Model::Package.new(parts, document)

        Serializer.serialize(docx, package)
      end
    end
  end
end
