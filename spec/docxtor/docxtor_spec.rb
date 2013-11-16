require 'spec_helper'

describe Docxtor, "#generate" do
  context "when supplied with all the same parameters that Generator takes" do
    it 'does not throw errors' do
      expect {
        Docxtor.generate do
          p "Paragraph"
        end
      }
    end
  end
end
