require 'rspec/expectations'

RSpec::Matchers.define :exist_xpath do |xpath|
  EXPR_PREFIX = '//'
  LOCAL_NAME_EXPR = "*[local-name()='%s']"

  match do |actual|
    actual.should have_xpath(ignore_namespaces(xpath))
  end

  def ignore_namespaces(xpath)
    expressions = xpath.sub(EXPR_PREFIX, '').
      split('/').map { |expr| 
        element = expr.split(':').last
        LOCAL_NAME_EXPR % element
      }.join('/')

    EXPR_PREFIX + expressions
  end
end