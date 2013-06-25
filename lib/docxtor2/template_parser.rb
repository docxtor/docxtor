module Docxtor2
  class TemplateParser

    class << self
      def parse(template)
        instance = new(template)
        instance.parts
      end
    end

    def initialize(template)
      @parts = parse(template)
    end

    def parts
      @parts
    end

    private 
    
    def parse(template)
      Dir.chdir(@template) do
        files = Dir[configus.tempates.search_pattern]
        return Hash[files.map { |file| create_part(file) }]
      end
    end

    def create_part(file)
      content = File.read(file)
      part = Part.new(file, content)

      [file, part]
    end

  end
end