require 'spec_helper'

module Docxtor2
  describe Generator do
    include_context 'template' do
      context 'default template' do
        it 'should generate .docx file by using template DSL' do

          dsl_block = proc {}
          xml = double
          docx = double
          parts = double
          document = double

          TemplateParser.should_receive(:parse).
            with(template).and_return(parts)

          XmlBuilder.should_receive(:build).
            with(dsl_block).and_return(xml)

          DocumentBuilder.should_receive(:build).
            with(parts, xml).and_return(document)

          Serializer.should_receive(:serialize).
            with(docx, document)

          Docxtor2.generate(docx, &dsl_block)
        end
      end

    end
  end
end
