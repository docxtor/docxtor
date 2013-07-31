module Docxtor2
  class Generator
    class << self
      def generate(template, &block)
        parts = TemplateParser.parse(template)
        document = DocumentBuilder.build(&block);
        Package.new(parts, document)
      end
    end
  end
end
