require 'spec_helper'

module Docxtor2
  describe Package::Document::Paragraph do
  	include_context 'xmlbuilder' do

      subject {
        render(Package::Document::Paragraph, "text1", :b => true) do
          style 123
          spacing :before => 80, :after => 240
          indent :start => 720
          i; u

          w "text2"; br; w "text3"
        end
      }

      it 'should contain reference to style' do
        subject.should contain_element_style(:p)
      end

      it 'should contain spacing properties' do
        subject.should contain_element_property(:p, :spacing)
      end

      it 'should contain indentiation properties' do
        subject.should contain_element_property(:p, :ind)
      end

      context 'nested run' do
      	it 'should be bold' do
          subject.should contain_element_property(:r, :b)
        end

        it 'should be italic' do
          subject.should contain_element_property(:r, :i)
        end

        it 'should be underlined' do
          subject.should contain_element_property(:r, :u)
        end
    	end

  	end
  end
end