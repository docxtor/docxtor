require 'spec_helper'

module Docxtor2
  describe ContentBuilder do
    include XPathMatchers

    context 'with DSL instruction' do
      context 'table of contents' do
        subject { ContentBuilder.build { table_of_contents "toc" } }

        it 'should contain gallery of document parts' do
          subject.should exist_xpath('//w:sdt/w:sdtPr/w:docPartObj/w:docPartGallery')
        end

        it 'should contain heading text' do
          subject.should exist_xpath('//w:sdt/w:sdtContent/w:p/w:r/w:t')
        end

        # TODO: Add more precise tests (see TODO in exist_xpath.rb)
      end

      it 'should contain paragraph' do
        ContentBuilder.build {
          p 'Paragraph'
        }.should exist_xpath('//w:p/w:r/w:t')
      end

      context 'heading' do
        it 'should contain style' do
          ContentBuilder.build {
              h "Heading1", 1
            }.should exist_xpath('//w:p/w:pPr/w:pStyle')
        end
      end
    end
  end
end
