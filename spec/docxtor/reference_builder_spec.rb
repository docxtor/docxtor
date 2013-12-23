require 'spec_helper'

module Docxtor
  describe ReferenceBuilder do
    let(:element) { double("Document::RunningElement") }

    subject { ReferenceBuilder.new([element]) }

    before do
      element.stub(:name) { "header1.xml" }
      element.stub(:reference_type) { "header" }
      element.stub(:reference_id=) { "rId1" }
      element.stub(:reference_id) { "rId1" }
    end

    it "responds to #filename" do
      expect { subject.respond_to? :filename }
    end

    it "renders xml with element's reference info" do
      expect {
        subject.content.include?("Relationship")
        subject.content.include?("header1.xml")
      }
    end
  end
end
