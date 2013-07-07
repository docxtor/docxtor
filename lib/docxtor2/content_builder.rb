module Docxtor2
  class ContentBuilder
    include Evaluator

    class << self
      def build(&block)
        instance = new(block)
        instance.build
      end
    end
      
    def initialize(block)
      @klass_map = {
        :table_of_contents  => Package::Document::TableOfContents,
        :p                  => Package::Document::Paragraph,
        :h                  => Package::Document::Heading
      }
      
      @elements = []
      evaluate &block
    end

    def build
      result = ''
      xml = Builder::XmlMarkup.new(:target => result)
      @elements.each do |el|
        el.render(xml)
      end
      result
    end

    def method_missing(method_name, *arguments, &block)
      klass = @klass_map[method_name]
      super if klass.nil?

      cache_method_call(method_name, klass)

      self << self.send(method_name, *arguments, &block)
    end

    def respond_to_missing?(method_name, include_private = false)
      @klass_map.key?(method_name) || super
    end

    private

    def cache_method_call(method_name, klass)
      define_method(method_name) do |*args, &block| 
        klass.new(*args, &block)
      end
    end

    def <<(element)
      @elements << element
      element
    end
  end
end
