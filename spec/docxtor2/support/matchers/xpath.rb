require 'rspec/expectations'

RSpec::Matchers.define :exist_xpath do |xpath|
  EXPR_PREFIX = '//'
  LOCAL_NAME_EXPR = "*[local-name()='%s']"

  match do |actual|
    p ignore_namespaces(xpath)
    actual.should have_xpath(ignore_namespaces(xpath))
  end

  failure_message_for_should do |actual|
    "expected xpath #{xpath} to exist in #{actual}"
  end

  description do
    "xpath #{xpath} exist"
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
