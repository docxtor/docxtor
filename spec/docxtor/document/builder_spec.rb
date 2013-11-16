require 'spec_helper'

module Docxtor
  describe Document::Builder do
    include WordprocessingMLMatchers

    subject { Document::Builder.new [] do
      p "Hi"
      end
    }

    it 'contains body' do
      expect { subject contain_body }
    end
  end
end
