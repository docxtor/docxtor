require 'spec_helper'

module Docxtor2
  describe Package::Document::TableOfContents do
		include_context 'xmlbuilder' do
      
      subject { render(Package::Document::TableOfContents, 'Contents') }

      it 'should contain gallery of document parts' do
        subject.should contain_gallery_of_document_parts
      end

      it 'should contain heading text' do
        subject.should contain_sdt_content_heading
      end
    end
  end
end