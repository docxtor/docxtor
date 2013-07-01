module Docxtor2
  class DocumentBuilder
    class << self
      def build(&block)
        instance = new(block)
        instance.document
      end
    end

    def initialize(block)
      content = ContentBuilder.build(&block)
      @document = Package::Document.new(content)
    end

    def document
      @document
    end
  end
end
