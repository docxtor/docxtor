module Docxtor2
  module Model
    class Package::Part
      attr_reader :filepath, :content

      def initialize(filepath, content)
        @filepath = filepath
        @content = content
      end
    end
  end
end
