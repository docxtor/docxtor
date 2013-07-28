module Docxtor2
  class Package::Document::Heading < Package::Document::Paragraph
    H1 = 1
    H2 = 2

    def initialize(nesting = H1, *args, &block)
      super(*args, &block)
      @params[:style] ||= nesting
    end
  end
end