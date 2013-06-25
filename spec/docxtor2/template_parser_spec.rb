require 'spec_helper'

describe Docxtor2::TemplateParser do
  subject { Docxtor2::TemplateParser(template) }

  it 'should list template files' do
    Dir.chdir(template) do
      expected = Dir[search_pattern].length
    end
    subject.parts.should eql(expected)
  end
end