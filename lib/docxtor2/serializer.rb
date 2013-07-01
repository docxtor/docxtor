module Docxtor2
  class Serializer
    class << self
      def serialize(filepath, package)
        Zip::ZipFile.open(filepath, Zip::ZipFile::CREATE) do |io|
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
