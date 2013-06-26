require 'spec_helper'

module Docxtor2
  describe Docxtor2::Builder do
    include_context 'template' do
      let(:parts) { TemplateParser.parse(template) }

      it 'should contain paragraph when given by DSL' do
        p parts.keys

        result = Builder.build(parts['document']) do
          p 'Paragraph'
        end
        
        p result     
        result.should have_xpath('//w:p/w:r/w:t')
      end
    end
  end
end