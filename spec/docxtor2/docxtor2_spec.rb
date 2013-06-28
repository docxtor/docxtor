require 'spec_helper'

describe Docxtor2 do
  it 'should not throw errors when supplied all the same parameters that Generator takes' do
    docx = double
    lambda {
      Docxtor2.generate(docx, Docxtor2::Known::Templates::DEFAULT) do 
        p "Paragraph"
      end
    }.should_not raise_error
  end
end