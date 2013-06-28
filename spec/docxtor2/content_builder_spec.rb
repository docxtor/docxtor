require 'spec_helper'

module Docxtor2
  describe ContentBuilder do
    it 'should contain paragraph when given by DSL' do
      ContentBuilder.build {
        p 'Paragraph'
      }.should exist_xpath('//w:p/w:r/y:t')
    end
  end
end
