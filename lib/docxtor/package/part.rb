module Docxtor
  module Package
    class Part
      attr_reader :filename, :content

      def initialize(filename, content)
        @filename = filename
        @content = content
      end
    end
  end
end
