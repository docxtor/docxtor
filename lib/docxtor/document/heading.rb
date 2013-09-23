module Docxtor
  module Document
    class Heading < Paragraph
      H1 = 1
      H2 = 2

      def after_initialize(nesting = H1, *args)
        super(*args)
        @params[:style] ||= nesting
      end
    end
  end
end
