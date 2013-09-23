module Docxtor
  class Generator
    class << self
      def generate(template, &block)
        template_parser = TemplateParser.new(template)
        parts = template_parser.parts

        document = Document::Builder.new(&block)
        Package::Builder.new(parts, document)
      end
    end
  end
end
