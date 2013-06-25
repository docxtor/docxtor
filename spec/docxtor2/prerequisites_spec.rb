require 'spec_helper'

describe Docxtor2 do
  context 'prerequisites' do
    it 'should have a version number' do
      Docxtor2::VERSION.should_not be_nil
    end
  end
end