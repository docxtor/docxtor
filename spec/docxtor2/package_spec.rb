require 'spec_helper'

module Docxtor2
  describe Package do
    subject { Package.new({}, Package::Document.new('content', DOCUMENT_XML_PATH)) }

    include_context 'integration' do
      context "given filepath and source document" do
        it 'should serialize to file' do
          subject.serialize(docx)

          expect { File.exists?(docx) }
          deny { rescuing { File.delete(docx) } }
        end
      end

      context 'after serialization' do
        it 'should contain data' do
          string_io = subject.to_stream
          expect { string_io.size > 0 }
        end

        it 'should contain document part' do
          string_io = subject.to_stream
          istream = Zip::ZipInputStream.open_buffer(string_io)

          deny { rescuing {
            document_entry = istream.get_next_entry

            expect { document_entry != nil }
            expect { document_entry.name == DOCUMENT_XML_PATH }
          } }
        end
      end
    end
  end
end