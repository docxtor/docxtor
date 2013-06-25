module Docxtor2
  class Builder
    class << self
      def build(template, &block)
        instance = new(template, block)
        instance.document
      end
    end

    def initialize(template, block)
      @template = template
      @config = { :h1 => {}, :h2 => {}, :p => {} }
      instance_eval &block
    end

    def document
      @parts = TemplateParser.parse(@template)
      @document = Document.new(@parts)
      
      apply

      @document
    end

    # 1. Хуня собирает дслем инфу че впихать куда
    # 2. Разбирает директорию с шаблон и вхуячивает описанное дслем куда надо
    # 3. Возвращает хэш (Document) генератору и он зипует

    def toc!
      table_of_contents!
    end

    def table_of_contents!
    end

    def h1(title)
    end

    def h2(title)
    end

    def p(content)
    end

    private

    def apply
      
    end
  end
end