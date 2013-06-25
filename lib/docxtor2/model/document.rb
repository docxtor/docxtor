module Docxtor2
  module Model
    class Document
      attr_reader :parts

      def initialize(parts)
        @parts = parts
      end
    end
  end
end