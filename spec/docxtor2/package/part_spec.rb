require 'spec_helper'

module Docxtor2
  describe Package::Part do
    subject { Package::Part.new("filename", "content") }

    it 'should return given filename' do
      expect { subject.filename == "filename" }
    end
    it 'should return given content' do
      expect { subject.content == "content" }
    end
  end
end