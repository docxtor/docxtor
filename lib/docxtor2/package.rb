module Docxtor2
  class Package
    attr_reader :parts

    def initialize(parts, document)
      @parts = parts
      @parts[Known::Parts::DOCUMENT] = document
    end
  end
end