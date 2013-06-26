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
      Dir.chdir(template) do
        Hash[Dir[configus.search_pattern].map { |file| create_part(file) }]
      end
    end

    def create_part(file)
      content = File.read(file)
      path = file.gsub(configus.builder_ext, '')
      part = Model::Document::Part.new(path, content)
      key = File.basename(path, '.xml')

      [key, part]
    end

  end
end