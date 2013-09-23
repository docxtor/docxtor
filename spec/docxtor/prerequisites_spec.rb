require 'spec_helper'

describe Docxtor do
  context 'prerequisites' do
    it 'has a version number' do
      expect { Docxtor::VERSION != nil }
    end
  end
end
