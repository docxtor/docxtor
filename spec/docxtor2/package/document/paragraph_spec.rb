require 'spec_helper'

module Docxtor2
  describe Package::Document::Paragraph do
  	include_context 'xmlbuilder' do
    	it 'should render paragraph properties'
    	it 'should render run properties'
  	end
  end
end