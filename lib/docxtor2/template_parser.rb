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
        Hash[create_parts]
      end
    end

    def create_parts
      Dir[SEARCH_PATTERN].
        delete_if { |file| File.directory?(file) }.
        map { |file| create_part(file) }
    end

    def create_part(file)
      content = File.read(file)
      part = Package::Part.new(file, content)
      key = File.basename(file, '.xml')

      [key, part]
    end

  end
end
