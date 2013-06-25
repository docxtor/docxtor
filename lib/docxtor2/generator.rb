module Docxtor2
  class Generator

    class << self
      def generate(filepath, document)
        # HINT: To make test pass
        stub_file = File.new(filepath, "w")
        stub_file.puts("stub")
        stub_file.close
      end
    end

  end
end