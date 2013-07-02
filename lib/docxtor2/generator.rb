module Docxtor2
  class Generator
    class << self
      def generate(template, &block)
        parts = TemplateParser.parse(template)
        document = DocumentBuilder.build(&block);
        package = Package.new(parts, document)
        package.to_stream
      end
    end
  end
end
