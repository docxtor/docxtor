require 'spec_helper'

module Docxtor2
  describe Package::Document::Paragraph do
  	include_context 'xmlbuilder' do

      subject {
        render(Package::Document::Paragraph, "text1", :bold => true) do
          style 123
          
          italic
          underline

          write "text2"
          line_break
          write "text3"
        end
      }

      it 'should contain reference to style' do
        subject.should contain_element_style(:p)
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