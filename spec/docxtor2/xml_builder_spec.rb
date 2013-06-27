require 'spec_helper'

module Docxtor2
  describe Docxtor2::XmlBuilder do
    it 'should contain paragraph when given by DSL' do
      XmlBuilder.build {
        p 'Paragraph'
      }.should exist_xpath('//w:p/w:r/y:t')
    end
  end
end
