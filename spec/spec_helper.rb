$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'docxtor2'

if ENV[:test]
  Coveralls.wear!
end