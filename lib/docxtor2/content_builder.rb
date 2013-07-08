module Docxtor2
  class ContentBuilder
    include BlockEvaluator

    class << self
      def build(&block)
        instance = new(block)
        instance.build
      end
    end

    { :table_of_contents  => Package::Document::TableOfContents,
      :p                  => Package::Document::Paragraph,
      :h                  => Package::Document::Heading,
      :table              => NoMethodError.new("Element is not supported yet")
    }.each do |name, klass|
      define_method(name) do |*args, &block| 
        self << klass.new(*args, &block)
      end
    end

    def initialize(block)
      @elements = []
      evaluate &block
    end

    def build
      result = ''
      xml = Builder::XmlMarkup.new(:target => result)
      @elements.each { |el| el.render(xml) }
      result
    end

    def <<(el)
      @elements << el
      el
    end
  
  end
end
