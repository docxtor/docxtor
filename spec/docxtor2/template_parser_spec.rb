require 'spec_helper'

module Docxtor2
  describe TemplateParser do
    include_context 'integration' do
      subject { TemplateParser.new(template) }

      it 'should found exact count of template files' do
        expected = Dir.chdir(template) { 
          Dir[SEARCH_PATTERN].
          delete_if { |file| File.directory?(file) }.
          length 
        }
        subject.parts.length.should eql(expected)
      end
    end
  end
end