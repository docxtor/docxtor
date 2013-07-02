module Docxtor2
  class Package
    attr_reader :parts

    def initialize(parts, document)
      @parts = parts
      @parts[Known::Parts::DOCUMENT] = document
    end

    def serialize(filepath)
      Zip::ZipOutputStream.open(filepath) do |stream|
        write_parts(stream)
      end
    end

    def to_stream
      stream = Zip::ZipOutputStream.new("streamed", true)
      write_parts(stream)
      stream.close_buffer.rewind
      stream
    end

    private

    def write_parts(stream)
      @parts.each do |name, part|
        stream.put_next_entry(part.filepath)
        stream << part.content
      end
    end
  end
end