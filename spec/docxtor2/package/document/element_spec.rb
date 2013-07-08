require 'spec_helper'

module Docxtor2
  describe Package::Document::Element do
    include_context "xmlbuilder" do

      subject {
        render(Package::Document::Element, :style => 1) do
          el(:p) do
            el(:r)
          end
        end
      }

	    it 'should render element with attributes' do
	  		subject.should contain_paragraph_run
	    	subject.should contain_element_style(:p)
	  	end
		end
  end
end