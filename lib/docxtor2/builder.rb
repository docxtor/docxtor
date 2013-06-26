require "builder"

module Docxtor2
  class Builder
    class << self
      def build(document, &block)
        # TODO: Add assert that document.is_dynamic

        instance = new(document, block)
        instance.result
      end
    end

    def initialize(document, block)
      @document = document
      
      @result = ''
      @content = ''

      @x = ::Builder::XmlMarkup.new(
        :target => @content, 
        :indent => 2
      )

      instance_eval &block
      
      # TODO: Find a better way to use eval with binding
      content = @content
      
      # TODO: Continue here!
      xml = ::Builder::XmlMarkup.new(
        :target => @result, 
        :indent => 2
      )

      @result = eval(@document.content)
    end

    def result
      @result
    end

    def render
      @content
    end

    def p(content)
      @x.w :p do 
        @x.w :r do
          @x.w :t do 
            @x.text! content
          end
        end
      end
    end
  end
end