require 'spec_helper'

module Docxtor2
  describe Package::Part do
    subject { Package::Part.new("filename", "content") }

    it 'should return given filename' do
      subject.filename.should eql("filename")
    end
    it 'should return given content' do
      subject.content.should eql("content")
    end
  end
end