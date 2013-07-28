module Docxtor2
  class ElementList
    def initialize
      @elements = []
    end

    def self.map(mappings)
      mappings.each do |name, klass|
        define_method(name) do |*args, &block|
          self << klass.new(*args, &block)
        end
      end
    end

    protected

    def write_elements(xml)
      @elements.each { |el| el.render(xml) }
    end

    def <<(el)
      @elements << el
      el
    end
  end
end