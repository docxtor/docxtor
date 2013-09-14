require 'spec_helper'

module Docxtor2
  describe Package::DocumentBuilder do
  	include WordprocessingMLMatchers

    subject { Package::DocumentBuilder.new('content') do
      p "Hi"
      end
    }

    it 'contains body' do
      subject.content.should contain_body
    end
  end
end
