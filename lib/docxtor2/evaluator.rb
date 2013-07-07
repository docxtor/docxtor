module Docxtor2
  module Evaluator
    def evaluate(&block)
      if block_given?
        if block.arity == 1
          yield self
        else
          instance_eval &block
        end
      end
    end
  end
end