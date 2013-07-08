module Docxtor2
  class Package::Document::Heading < Package::Document::Paragraph
    def initialize(nesting = 1, &block)
      super({ :style => nesting }, &block)
    end
  end
end