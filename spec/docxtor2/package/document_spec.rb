require 'spec_helper'

module Docxtor2
  describe Package::Document do
    subject { Package::Document.new('content', DOCUMENT_XML_PATH) }

    it 'should contain given content in //w:document/w:body' do
      subject.content.should exist_xpath('//w:document/w:body')
    end
  end
end