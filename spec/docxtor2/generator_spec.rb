require 'spec_helper'

module Docxtor2
  describe Generator do
    context 'default template' do
      it 'guarantees that known collaborators receive required calls and return required values' do

        dsl_block = proc {}
        docx = double
        parts = double
        document = double
        package = double

        TemplateParser.should_receive(:parse).
          with(Known::Templates::DEFAULT).
          and_return(parts)

        DocumentBuilder.should_receive(:build).
          with(&dsl_block).
          and_return(document)

        Package.should_receive(:new).
          with(parts, document).
          and_return(package)

        package.should_receive(:to_stream)

        Docxtor2.generate(&dsl_block)
      end
    end
  end
end
