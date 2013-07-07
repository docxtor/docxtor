module Docxtor2
  class Package::Document::Paragraph < Package::Document::Element
    def initialize(text = nil, attrs = {}, &block)
      super(attrs, &block)
      @contents = [text]
    end

    def render(xml)
      @xml = xml

      el(:p) do
        el(:r) do
          contents
        end
      end
    end

    def italic
      @props[:italic] = true
    end

    def bold
      @props[:bold] = true
    end

    def line_break
      @contents << :br
    end

    def preserve_whitespace
      @props[:space] = 'preserve'
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
      @xml.w :t, 'xml:space' => @props[:space] do
        @xml.text! text
      end
    end

    def br
      @xml.w :br
    end
  end
end
  