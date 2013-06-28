module Docxtor2
  class ContentBuilder
    class << self
      def build(&block)
        instance = new(block)
        instance.xml
      end
    end

    def initialize(block)
      @xml = ''
      @b = Builder::XmlMarkup.new(:target => @xml)
      instance_eval &block
    end

    def xml
      @xml
    end

    def p(content)
      @b.w :p do
        @b.w :r do
          @b.w :t do
            @b.text! content
          end
        end
      end
    end
  end
end
