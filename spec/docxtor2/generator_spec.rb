require 'spec_helper'

module Docxtor2
  describe Generator do
    context 'default template' do
      it 'should generate .docx file by using template DSL' do

        dsl_block = proc {}
        content = double
        docx = double
        parts = double
        document = double
        package = double

        TemplateParser.should_receive(:parse).
          with(Known::Templates::DEFAULT).
          and_return(parts)

        ContentBuilder.should_receive(:build).
          with(dsl_block).
          and_return(content)

        Model::Package::Document.should_receive(:new).
          with(DOCUMENT_XML_PATH, content).
          and_return(document)

        Model::Package.should_receive(:new).
          with(parts, document).
          and_return(package)

        Serializer.should_receive(:serialize).
          with(docx, package)

        Docxtor2.generate(docx, &dsl_block)
      end
    end
  end
end
