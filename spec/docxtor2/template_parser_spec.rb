require 'spec_helper'

module Docxtor2
  describe TemplateParser do
    include_context 'integration' do
      subject { TemplateParser.new(template) }

      it 'finds exact count of template files' do
        expected = Dir.chdir(template) {
          Dir[TemplateParser::FILES_PATTERN].
          delete_if { |file| File.directory?(file) }.
          length
        }
        expect { subject.parts.length == expected }
      end
    end
  end
end
