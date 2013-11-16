module Docxtor
  class TemplateParser
    attr_accessor :template

    FILES_PATTERN = File.join('**', '{*,.}{xml,rels}')

    def initialize(template = nil)
      @template = template || File.join(File.dirname(__FILE__), "..", "..", "templates", "default")
    end

    def parts
      Dir.chdir(template) do
        create_parts
      end
    end

    def create_parts
      Dir[FILES_PATTERN].
        delete_if { |file| File.directory?(file) }.
        map { |file| create_part(file) }
    end

    def create_part(file)
      content = File.read(file)
      part = Package::Part.new(file, content)

      part
    end

  end
end
