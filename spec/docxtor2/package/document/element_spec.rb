require 'spec_helper'

module Docxtor2
  describe Package::Document::Element do
    include_context "xmlbuilder" do
	    it 'should render element with attributes' do
	    	actual = render(:style => 1) {
	    		el(:p) { 
	    			el(:r)
  				}
	  		}

	  		actual.should contain_paragraph_run
	    	actual.should contain_element_style(:p)
	  	end

      def render(attrs = {}, &block)
        el = Package::Document::Element.new(attrs, &block)
	    	el.render(builder)
	    	result
			end
		end
  end
end