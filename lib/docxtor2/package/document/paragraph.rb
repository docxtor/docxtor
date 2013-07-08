module Docxtor2
  class Package::Document::Paragraph < Package::Document::Element
    def initialize(text = nil, attrs = {}, &block)
      super(attrs, &block)
      @contents = [text]
    end

    def render(xml)
      super(xml)
      
      el(:p) do
        el(:r) do
          contents
        end
      end
    end

    def italic
      @attrs[:italic] = true
    end

    def bold
      @attrs[:bold] = true
    end

    def line_break
      @contents << :br
    end

    def preserve_whitespace
      @attrs[:space] = 'preserve'
    end

    def write(text)
      @contents << text
    end

    private 

    def contents
      @contents.each { |c| content(c) }
    end

    def content(c)
      c == :br ? br : text(c)
    end

    def text(text)
      @xml.w :t, 'xml:space' => @attrs[:space] do
        @xml.text! text
      end
    end

    def br
      @xml.w :br
    end
  end
end
  