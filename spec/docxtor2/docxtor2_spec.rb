require 'spec_helper'

module Docxtor2
  describe Docxtor2 do
    include_context 'template' do
      context 'default template' do
        it 'should generate .docx file by using template DSL' do
          
          dsl_block = proc {}
          doc = double
          docx = double

          Builder.should_receive(:build).
            with(dsl_block).and_return(doc)

          Generator.should_receive(:generate).
            with({:template => configus.templates.default,
                  :document => doc,
                  :docx => docx})

          Docxtor2.generate(docx, &dsl_block)
          # do
          #   toc!

          #   h1 "Heading1a"
          #   p "Paragraph1"

          #   h1 "Heading1b"
          #   h2 "Heading2"
          #   p "Paragraph2"
          # end


        end
      end

    end
  end
end