module Docxtor2
  class Serializer
    class << self
      def serialize(filepath, document)
        document.each do |part|
          Zip::ZipFile.open(filepath) do |io|
            io.get_output_stream(part.filepath) do |file|
              file << part.content
            end
          end
        end
      end
    end
  end
end
