module Docxtor2
  class Package::Document::PageBreak < Package::Document::Element
    def initialize(*args, &block)
      super(*args, &block)
    end

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