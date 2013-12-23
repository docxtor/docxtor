require 'spec_helper'

module Docxtor
  describe Document::TableOfContents do
    include_context 'xmlbuilder' do

      subject { render(Document::TableOfContents, 'Contents') }

      it 'contains gallery of document parts' do
        expect { subject.include? "docPartGallery" }
      end
    end
  end
end
