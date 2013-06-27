module Docxtor2
  class Serializer
    class << self
      def serialize(filepath, document)
        Zip::File.open(filepath, Zip::File::CREATE) do |io|
          document.parts.each do |name, part|
            io.get_output_stream(part.filepath) do |file|
              file << part.content
            end
          end
        end
      end
    end
  end
end
