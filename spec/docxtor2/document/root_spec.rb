require 'spec_helper'

module Docxtor2
  describe Document::Root do
    include_context "xmlbuilder" do

      subject {
        Document::Root.new(:style => 1) do
          p do
            w "Hi"
          end
        end
      }

	    it 'appends element to elements' do
	  		subject.elements.first.should be_instance_of Docxtor2::Document::Paragraph
	  	end
		end
  end
end
