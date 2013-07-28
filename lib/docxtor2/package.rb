module Docxtor2
  class Package
    attr_reader :parts

    def initialize(parts, document)
      @parts = parts
      @parts[Known::Parts::DOCUMENT] = document
    end

    def save(filepath)
      Zip::ZipOutputStream.open(filepath) do |ostream|
        write_parts(ostream)
      end
    end

    def to_stream
      ostream = Zip::ZipOutputStream.new("streamed", true)
      write_parts(ostream)
      string_io = ostream.close_buffer
      string_io.rewind
      string_io
    end

    private

    def write_parts(ostream)
      @parts.each do |name, part|
        ostream.put_next_entry(part.filename)
        ostream.puts part.content
      end
    end
  end
end