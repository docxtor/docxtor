require 'spec_helper'

module Docxtor
  describe Document::Builder do
    subject { Document::Builder.new [] do
      p "Hi"
      end
    }

    it 'contains body' do
      expect { subject.content.include? "body" }
    end
  end
end
