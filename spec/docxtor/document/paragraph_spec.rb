require 'spec_helper'

module Docxtor
  describe Document::Paragraph do
    include_context 'xmlbuilder' do

      subject {
        render(Document::Paragraph, "text1", :b => true) do
          style 123
          spacing :before => 80, :after => 240
          font_size 32
          font_size_complex 30
          indent :start => 720
          i; u

          w "text2"; br; w "text3"
        end
      }

      it 'contains reference to style' do
        subject.should contain_element_style(:p)
      end

      it 'contains spacing property' do
        subject.should contain_element_property(:p, :spacing)
      end

      it 'contains font size property' do
        subject.should contain_element_property(:p, :sz)
      end

      it 'contains complex font size property' do
        subject.should contain_element_property(:p, :szCs)
      end

      it 'contains indentiation property' do
        subject.should contain_element_property(:p, :ind)
      end

      context 'nested run' do
        it 'is bold' do
          subject.should contain_element_property(:r, :b)
        end

        it 'is italic' do
          subject.should contain_element_property(:r, :i)
        end

        it 'is underlined' do
          subject.should contain_element_property(:r, :u)
        end
      end

    end
  end
end
