require 'tempfile'
require 'spec_helper'

module Docxtor
  describe Package::Builder do
    let(:document) { double("Document::Builder") }
    let(:part) { double("Package::Part") }
    let(:header) { double("RunningElement") }

    subject { Package::Builder.new([part, document, header]) }
    before do
      part.stub(:filename) {"word/settings.xml"}
      part.stub(:content) {"settings"}

      document.stub(:filename) {"word/document.xml"}
      document.stub(:content) {"content"}

      header.stub(:type) {:header}
      header.stub(:filename) {"word/header1.xml"}
      header.stub(:content) {"header"}
    end

    describe "#initialize" do
      it "builds list of package parts from provided arguments" do
        document_part = subject.parts.find {|part| part.filename == "word/document.xml"}
        expect {
          !document.nil?
          subject.parts.count == 3
        }
      end
    end

    include_context 'integration' do
      context "given filepath and source document" do
        it 'saves to file' do
          subject.save(docx)

          expect { File.exists?(docx) }
          deny { rescuing { File.delete(docx) } }
        end
      end

      context 'after serialization' do
        before do
          @tempfile = Tempfile.new("test.docx")
          subject.save(@tempfile.path)
          zip_input_stream = Zip::ZipInputStream.open(@tempfile.path)

          while (entry = zip_input_stream.get_next_entry)
            @document_entry = entry if entry.name == "word/document.xml"
            @header_entry = entry if entry.name = "word/header1.xml"
          end
        end

        after do
          @tempfile.unlink
        end

        it 'contains data' do
          expect { @tempfile.size > 0 }
        end

        it 'contains document part' do
          expect {
            @document_entry
          }
        end

        it 'contains running elements part' do
          expect {
            @header_entry
          }
        end
      end
    end
  end
end
