module Docxtor2
  module Model
    class Node
      attr_reader :name, :content, :attributes, :children

      def initialize(name, attributes = {})
        @name = name
        @children = []
        @content = attributes.delete(:content)
        @attributes = attributes
      end

      def <<(child)
        @children << child
        child
      end

      def remove(child)
        @children.delete(child)
        self
      end
    end
  end
end