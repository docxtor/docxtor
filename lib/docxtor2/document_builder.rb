module Docxtor2
  class DocumentBuilder
    # TODO: Implement (:
    # Responsibility: it should generate Document by just inserting xml
    # into appropriate place (document.xml)

    class << self
      def build(parts, xml)
        instance = new(parts, xml)
        instance.document
      end
    end

    def initialize(parts, xml)
      @document = Model::Document.new(parts)

      # TODO: Fuck it, build it here
    end

    def document
      @document
    end
  end
end
