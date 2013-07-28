module Docxtor2
  module ObjectUtils
    def find_argument(args, klass, default = nil)
      args.find { |arg| arg.is_a? klass } || default
    end
  end
end