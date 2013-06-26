require 'spec_helper'

describe Docxtor2::TemplateParser do
  include_context 'template' do
    subject { Docxtor2::TemplateParser.new(template) }

    it 'should list template files' do
      expected = Dir.chdir(template) { 
        Dir[search_pattern].length 
      }
      subject.parts.length.should eql(expected)
    end
  end
end