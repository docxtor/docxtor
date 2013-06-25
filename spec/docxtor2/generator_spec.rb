require 'spec_helper'

describe Docxtor2::Generator do
  include_context 'template' do
    it 'should generate file by given filepath and source document' do
      Docxtor2::Generator.generate(template, docx) do
        p "Paragraph1"
      end

      File.exists?(docx).should be_true
      lambda { File.delete(docx) }.should_not raise_error
    end
  end
end
