require 'spec_helper'

module Docxtor2
  describe Package::Builder do
    subject { Package::Builder.new({}, Package::Part.new("word/document.xml", 'content')) }

    include_context 'integration' do
      context "given filepath and source document" do
        it 'saves to file' do
          subject.save(docx)

          expect { File.exists?(docx) }
          deny { rescuing { File.delete(docx) } }
        end
      end

      context 'after serialization' do
        it 'contains data' do
          string_io = subject.to_stream
          expect { string_io.size > 0 }
        end

        it 'contains document part' do
          string_io = subject.to_stream
          istream = Zip::ZipInputStream.open_buffer(string_io)

          deny { rescuing {
            document_entry = istream.get_next_entry

            expect { document_entry != nil }
            expect { document_entry.name == "word/document.xml" }
          } }
        end
      end
    end
  end
end
