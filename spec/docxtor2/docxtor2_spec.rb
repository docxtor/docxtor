require 'spec_helper'

describe Docxtor2::Docxtor do
  context 'generating from DSL' do
    TEMP_DIR_NAME = 'tmp'
    TEMP_DIR_PERMISSIONS = 0666

    DOCX_FILE_NAME = 'test.docx'

    subject { Docxtor2::Docxtor.new }

    before(:all) do
      @tmp_path = File.join(File.dirname(__FILE__), TEMP_DIR_NAME)
      @docx_path = File.join(@tmp_path, DOCX_FILE_NAME)

      Dir.mkdir(@tmp_path, TEMP_DIR_PERMISSIONS);
    end
    after(:all) do
      Dir.rmdir(@tmp_path);
    end

    it 'should generate .docx from DSL' do
      subject.generate(@docx_path) do |doc|

        doc.table_of_contents! # doc.toc!

        doc.h1 "Heading1" 
        doc.p "Paragraph1"
      end

      File.exists?(@docx_path).should be_true
      lambda { FileUtils.rm_f(@docx_path, :force => true) }.should_not raise_error
    end
  end

  context 'prerequisites' do
    it 'should have a version number' do
      Docxtor2::VERSION.should_not be_nil
    end
  end  
end
