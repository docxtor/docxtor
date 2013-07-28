module XPathMatchers
  class ExistXPath
    include RSpecXML::XMLMatchers

    EXPR_PREFIX = '//'
    LOCAL_NAME_EXPR = "*[local-name()='%s']"
    ATTRIBUTE_SEPARATORS = ['|', '&', 'and', 'or']

    def initialize(expected)
      @expected = expected
    end

    # TODO: Not working/showing as expected, find out why
    # maybe its deprecated
    def failure_message_for_should
      "expected xpath #{@expected} to exist in #{@target.inspect}"
    end

    def matches?(target)
      @target = target
      @target.should have_xpath(self.class.ignore_namespaces(@expected))
    end

    private

    # TODO: Write tests, use this instead of old version

    # def self.to_local_name2(expr)
    #   parts = expr.sub('*', '').split('[')
    #   result = LOCAL_NAME_EXPR % parts.first.split(':').last
    #   if parts.length > 1
    #     attributes = parts[1][0..-1]
    #     separators_regexp = Regexp.new(ATTRIBUTE_SEPARATORS.join)
    #     attributes.split(separators_regexp).map { |token|
    #       attributes.sub!(token, LOCAL_NAME_EXPR % token.split(':').last)
    #     }
    #     result += attributes
    #   end
    #   result
    # end

    # TODO: Make it work with attributes

    # //person[@id='abc123']/@*[name()='weight' or name()='haircolor']
    # //person[@id='abc123']/(@haircolor|@weight)`

    # [@id='abc123']
    # @*[name()='weight' or name()='haircolor']

    # takes smth like //w:p/w:r and
    # returns //*[local-name()='p']/*[local-name()='r]
    def self.ignore_namespaces(xpath)
      expressions = xpath.sub(EXPR_PREFIX, '').
        split('/').map { |expr| to_local_name(expr) }.join('/')
      EXPR_PREFIX + expressions
    end

    def self.to_local_name(expr)
      element = expr.split(':').last
      LOCAL_NAME_EXPR % element
    end
  end
end
