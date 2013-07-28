require 'spec_helper'

describe Docxtor2 do
  context 'prerequisites' do
    it 'should have a version number' do
      expect { Docxtor2::VERSION != nil }
    end
  end
end