require 'spec_helper'

describe Docxtor2 do
  context 'prerequisites' do
    it 'has a version number' do
      expect { Docxtor2::VERSION != nil }
    end
  end
end