require 'spec_helper'

module Docxtor2
  describe Docxtor2::XmlBuilder do
    include_context 'template' do
      let(:parts) { TemplateParser.parse(template) }

      it 'should contain paragraph when given by DSL' do
        Builder.build {
          p 'Paragraph'
        }.should have_xpath('//w:p/w:r/w:t')
      end
    end
  end
end
