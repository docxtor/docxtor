require 'spec_helper'

module Docxtor2
  describe Package do
    subject { Package.new({}, Package::Document.new(DOCUMENT_XML_PATH, 'content')) }

    include_context 'integration' do
      it 'should serialize to file by given filepath and source document' do
        subject.serialize(docx)

        File.exists?(docx).should be_true
        lambda { File.delete(docx) }.should_not raise_error
      end

      it 'should serialize to stream' do
        subject.to_stream.should_not be_nil
      end
    end
  end
end