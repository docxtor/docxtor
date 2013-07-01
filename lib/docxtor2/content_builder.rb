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

    def table_of_contents!
      toc!
    end

    def toc!
      Package::Document::TableOfContents.new(@b)
    end

    def h1(text)
      Package::Document::Heading.new(@b, text, 1)
    end

    def h2(text)
      Package::Document::Heading.new(@b, text, 2)
    end

    def p(text)
      Package::Document::Paragraph.new(@b, text)
    end
  end
end
