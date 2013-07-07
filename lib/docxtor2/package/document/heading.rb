module Docxtor2
  class Package::Document::Heading < Package::Document::Paragraph
    def initialize(text, nesting, &block)
      super(text, { :style => nesting }, &block)
    end
  end
end