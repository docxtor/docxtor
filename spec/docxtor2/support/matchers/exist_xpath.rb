module XPathMatchers
  class ExistXPath
    include RSpec::Matchers
    include RSpecXML::XMLMatchers

    EXPR_PREFIX = '//'
    LOCAL_NAME_EXPR = "*[local-name()='%s']"

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
    
    def self.ignore_namespaces(xpath)
      expressions = xpath.sub(EXPR_PREFIX, '').
        split('/').map { |expr|
          element = expr.split(':').last
          LOCAL_NAME_EXPR % element
        }.join('/')

      EXPR_PREFIX + expressions
    end
  end
end
