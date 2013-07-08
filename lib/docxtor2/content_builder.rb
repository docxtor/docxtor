module Docxtor2
  class ContentBuilder
    include BlockEvaluator

    class << self
      def build(&block)
        instance = new(block)
        instance.build
      end
    end

    @@map = {
      :table_of_contents  => Package::Document::TableOfContents,
      :p                  => Package::Document::Paragraph,
      :h                  => Package::Document::Heading
    }

    def initialize(block)
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

    def method_missing(name, *args, &block)
      klass = @@map[name]
      super if klass.nil?

      cache_method_call(name, klass)
      self << self.send(name, *args, &block)
    end

    def respond_to_missing?(name, include_private = false)
      @@map.key?(name) || super
    end

    def <<(el)
      @elements << el
      el
    end
    
    private

    def cache_method_call(name, klass)
      self.class.define_method(name) do |*args, &block| 
        klass.new(*args, &block)
      end
    end
  end
end
