require 'spec_helper'

module Docxtor2
  describe Package::Document do
  	include WordprocessingMLMatchers

    subject { Package::Document.new('content', DOCUMENT_XML_PATH) }

    it 'contains body' do
      subject.content.should contain_body
    end
  end
end