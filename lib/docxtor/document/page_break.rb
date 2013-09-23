module Docxtor
  module Document
    class PageBreak < Element
      def render(xml)
        super
        write_element(:p) do
          write_element(:r) do
            xml.w :br, 'w:type' => 'page'
          end
        end
      end
    end
  end
end
