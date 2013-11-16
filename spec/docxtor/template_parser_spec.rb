require 'spec_helper'

module Docxtor
  describe TemplateParser do
    include_context 'integration' do
      subject { TemplateParser.new }

      it 'finds exact count of template files' do
        expected = Dir.chdir(template) {
          Dir[TemplateParser::FILES_PATTERN].
          delete_if { |file| File.directory?(file) }.
          count
        }
        expect { subject.parts.count == expected }
      end
    end
  end
end
