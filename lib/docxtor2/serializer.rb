module Docxtor2
  class Serializer
    class << self
      def serialize(filepath, package)

        # buffer = Zip::OutputStream.write_buffer do |out|
        #   package.parts.each do |name, part|
        #     out.put_next_entry(part.filepath)
        #     out.write(part.content)
        #   end
        # end

        # File.open(filepath, "wb") { |f| f.write(buffer.string) }

        Zip::File.open(filepath, Zip::File::CREATE) do |io|
          package.parts.each do |name, part|
            io.get_output_stream(part.filepath) do |file|
              file << part.content
            end
          end
        end

      end
    end
  end
end
