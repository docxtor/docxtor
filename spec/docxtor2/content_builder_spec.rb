require 'spec_helper'

module Docxtor2
  describe ContentBuilder do
    include WordprocessingMLMatchers

    subject { 
      ContentBuilder.build do
        table_of_contents 'Contents'
        p :style => 3 do
          text "content 1"
          line_break
          text "content 2"
        end
      end
    }

    it 'should render given DSL instructions' do
      subject.should contain_paragraph_text
      subject.should contain_element_style(:p)
      subject.should contain_table_of_contents
    end
  end
end
