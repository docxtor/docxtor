module Docxtor2
  class Package::Document::Paragraph < Package::Document::Element

    def initialize(*args, &block)
      super(*args, &block)
      @contents = self.class.create_contents(args)
    end

    def render(xml)
      super(xml)      
      el(:p) do
        el(:r) do
          contents
        end
      end
    end

    [:align, :style].each do |name|
      define_method(name) do |val|
        @attrs[name] = val
      end
    end

    [:bold, :italic, :underline].each do |name|
      define_method(name) do
        @attrs[name] = true
      end
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
      c == :br ? (@xml.w :br) : text(c)
    end

    def text(text)
      @xml.w :t, 'xml:space' => @attrs[:space] do
        @xml.text! text
      end
    end

    def self.create_contents(args)
      str = args.find { |arg| arg.is_a? String }
      str.nil? ? [] : [str]
    end

    alias_method :b, :bold
    alias_method :i, :italic
    alias_method :u, :underline
    alias_method :br, :line_break
    alias_method :w, :write
  end
end
  