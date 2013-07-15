require 'spec_helper'

module Docxtor2
  describe Package do
    subject { Package.new({}, Package::Document.new('content', DOCUMENT_XML_PATH)) }

    include_context 'integration' do
      it 'should serialize to file by given filepath and source document' do
        subject.serialize(docx)

        expect { File.exists?(docx) }
        lambda { File.delete(docx) }.should_not raise_error
      end

      context 'after serialization' do
        it 'should contain data' do
          string_io = subject.to_stream
          expect { string_io.size > 0 }
        end

        it 'should contain document part' do
          string_io = subject.to_stream
          istream = Zip::ZipInputStream.open_buffer(string_io)

          lambda { 
            document_entry = istream.get_next_entry 
            document_entry.should_not be_nil
            document_entry.name.should eql(DOCUMENT_XML_PATH)
          }.should_not raise_error
        end
      end
    end
  end
end