module Docxtor2
  module Model
    class Package
      attr_reader :parts

      def initialize(parts)
        @parts = parts
      end

      def document
        @parts[Known::Parts::DOCUMENT]
      end

      def document=(val)
        @parts[Known::Parts::DOCUMENT] = val
      end
    end
  end
end