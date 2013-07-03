module XPathMatchers
  class ExistXPath
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
    
    # takes smth like //w:p/w:r and
    # returns //*[local-name()='p']/*[local-name()='r]

    # TODO: Make it work with attributes
    # //w:p/w:rPr/w:pStyle[@w:val='h1']
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
