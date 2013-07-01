module XPathMatchers
  def exist_xpath(xpath)
    ExistXPath.new(xpath)
  end
end
