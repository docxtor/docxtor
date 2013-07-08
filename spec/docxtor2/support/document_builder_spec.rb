require 'spec_helper'

module Docxtor2
  describe DocumentBuilder do
    it 'should call known collaborators method and return document' do
      dsl_block = proc {}
      document = double

      DocumentBuilder.should_receive(:build).
        with(&dsl_block).
        and_return(document)

      DocumentBuilder.build(&dsl_block)
    end
  end
end