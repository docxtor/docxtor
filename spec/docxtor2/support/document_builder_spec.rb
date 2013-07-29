require 'spec_helper'

module Docxtor2
  describe DocumentBuilder do
    it 'calls known collaborators and returns document' do
      dsl_block = proc {}
      document = double
      content = double

      # DocumentBuilder.should_receive(:new).
      #   with(dsl_block)

      ContentBuilder.should_receive(:build).
        with(&dsl_block).
        and_return(content)

      DocumentBuilder.build(&dsl_block)
    end
  end
end