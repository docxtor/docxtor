require 'spec_helper'

module Docxtor
  describe Document::Builder do
    include WordprocessingMLMatchers

    subject { Document::Builder.new do
      p "Hi"
      end
    }

    it 'contains body' do
      subject.content.should contain_body
    end
  end
end
