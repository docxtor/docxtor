require 'spec_helper'

module Docxtor2
  describe Serializer do
    let(:document) { 
      Model::Document.new(
        :document => Model::Document::Part.new(
          'word/document.xml', 'content'
        )
      ) 
    }

    include_context 'integration' do
      it 'should generate file by given filepath and source document' do
        Serializer.serialize(docx, document) do
          p "Paragraph1"
        end

        File.exists?(docx).should be_true
        lambda { File.delete(docx) }.should_not raise_error
      end
    end
  end
end