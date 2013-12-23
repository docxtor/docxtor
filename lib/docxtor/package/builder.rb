module Docxtor
  module Package
    class Builder
      attr_reader :parts

      def initialize(parts)
        @parts = parts
      end

      def save(filepath)
        Zip::ZipOutputStream.open(filepath) do |ostream|
          write_parts(ostream)
        end
      end

      private

      def write_parts(ostream)
        @parts.each do |part|
          ostream.put_next_entry(part.filename)
          ostream.puts part.content
        end
      end
    end
  end
end
