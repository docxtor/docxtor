module Docxtor
  class RunningElementsBuilder
    attr_accessor :elements

    def method_missing method_name, *args
      num = 0
      if [:header, :footer].include? method_name
        num += 1
        @elements << RunningElement.new(method_name, num, *args)
      end
    end

    def initialize &block
      @elements = []
      instance_eval &block
    end
  end
end
