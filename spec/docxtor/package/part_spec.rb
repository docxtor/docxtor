require 'spec_helper'

module Docxtor
  describe Package::Part do
    context "given filename and content" do
      subject { Package::Part.new("filename", "content") }

      it 'returns filename' do
        expect { subject.filename == "filename" }
      end
      it 'returns content' do
        expect { subject.content == "content" }
      end
    end
  end
end
