require 'simplecov'
SimpleCov.start if ENV["COVERAGE"]

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'docxtor2'

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end