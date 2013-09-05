module Docxtor2
  class Generator
    class << self
      def generate(template, &block)
        template_parser = TemplateParser.new(template)
        parts = template_parser.parts

        document = DocumentBuilder.build(&block);
        PackageBuilder.new(parts, document)
      end
    end
  end
end
