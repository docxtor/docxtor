module Docxtor2
  class Package::Document::Heading < Package::Document::Paragraph
    def initialize(text, nesting = 1, &block)
      super(text, { :style => nesting }, &block)
    end
  end
end