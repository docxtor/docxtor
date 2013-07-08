require 'spec_helper'

module Docxtor2
  describe Package::Document::TableOfContents do
		include_context 'xmlbuilder' do
    	subject { Package::Document::TableOfContents.new('Contents') }

      before(:each) do
        subject.render(builder)
      end

      it 'should contain gallery of document parts' do
        result.should contain_gallery_of_document_parts
      end

      it 'should contain heading text' do
        result.should contain_sdt_content_heading
      end
    end
  end
end