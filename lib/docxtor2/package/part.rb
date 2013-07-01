module Docxtor2
  class Package::Part
    attr_reader :filepath, :content

    def initialize(filepath, content)
      @filepath = filepath
      @content = content
    end
  end
end
