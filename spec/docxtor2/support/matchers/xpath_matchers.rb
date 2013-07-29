module XPathMatchers
  extend RSpec::Matchers::DSL
  include RSpecXML::XMLMatchers

  EXPR_PREFIX = '//'
  LOCAL_NAME_EXPR = "*[local-name()='%s']"
  ATTRIBUTE_SEPARATORS = ['|', '&', 'and', 'or']

  matcher :exist_xpath do |xpath|
    match do |xml|
      xml.should have_xpath(ignore_namespaces(xpath))
    end
    description do
      "xpath #{xpath} exist"
    end

    failure_message_for_should do |actual|
      "expected xpath #{expected} to exist in #{actual}"
    end

    # TODO: Make it work with attributes
    # Typical cases are:
    #
    # //person[@id='abc123']/@*[name()='weight' or name()='haircolor']
    # //person[@id='abc123']/(@haircolor|@weight)`
    # [@id='abc123']
    # @*[name()='weight' or name()='haircolor']
    #
    # This should work, try it:
    #
    # //*[local-name()='a'][*[local-name()='aCode']='aaa']

    # takes smth like //w:p/w:r and
    # returns //*[local-name()='p']/*[local-name()='r]
    def ignore_namespaces(xpath)
      expressions = xpath.sub(EXPR_PREFIX, '').
        split('/').map { |expr| to_local_name(expr) }.join('/')
      EXPR_PREFIX + expressions
    end

    def to_local_name(expr)
      element = expr.split(':').last
      LOCAL_NAME_EXPR % element
    end
  end
end
