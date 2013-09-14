require 'spec_helper'

module Docxtor2
  describe Document::Element do
    include_context "xmlbuilder" do

      subject {
        render(Document::Element, :style => 1) do
          write_element(:p) do
            write_element(:r)
          end
        end
      }

	    it 'renders element with attributes' do
	  		subject.should contain_paragraph_run
	  	end
		end
  end
end
