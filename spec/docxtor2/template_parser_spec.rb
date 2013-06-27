require 'spec_helper'

module Docxtor2
  describe Docxtor2::TemplateParser do
    include_context 'template' do
      subject { TemplateParser.new(template) }

      it 'should found exact count of template files' do
        expected = Dir.chdir(template) { 
          Dir[SEARCH_PATTERN].length 
        }
        subject.parts.length.should eql(expected)
      end
    end
  end
end