require 'spec_helper'

describe Docxtor, "#generate" do
  context "when supplied all the same parameters that Generator takes" do
    it 'does not throw errors' do
      deny { rescuing {
          Docxtor.generate do
            p "Paragraph"
          end
      } }
    end
  end
end
