require 'spec_helper'

module Docxtor2
  describe Package::Document::Element do
    it 'should throw NotImplementedError on call to render method' do
      xml = double
      lambda { subject.render(xml) }.should raise_error(NotImplementedError)
    end
  end
end