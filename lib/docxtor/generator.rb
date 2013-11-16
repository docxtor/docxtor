module Docxtor
  class Generator
    class << self
      def generate(template, &block)
        template_parser = TemplateParser.new(template)
        parts = template_parser.parts

        running_elements = RunningElementsBuilder.new(&block).elements
        parts += running_elements

        parts << ReferenceBuilder.new(running_elements)
        parts << Document::Builder.new(running_elements, &block)

        Package::Builder.new(parts)
      end
    end
  end
end
