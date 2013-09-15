module Docxtor2
  module Document
    class PageBreak < Element
      def render(xml)
        super(xml)
        write_element(:p) do
          write_element(:r) do
            @xml.w :br, 'w:type' => 'page'
          end
        end
      end
    end
  end
end
