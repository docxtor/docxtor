module Docxtor2
  class Package::Part
    attr_reader :filename, :content

    def initialize(filename, content)
      @filename = filename
      @content = content
    end
  end
end
