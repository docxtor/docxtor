if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'docxtor2'

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

['contexts', 'examples'].each do |dir|

  dir_pattern = File.join(File.dirname(__FILE__), 
    'docxtor2', 'support', dir, '**', '*.rb')
  Dir[File.expand_path(dir_pattern)].each { |f| require f }
end

RSpec.configure do |config|
  config.before(:all) do
    Dir.mkdir(configus.tmp.path, configus.tmp.permissions)
  end
  config.after(:all) do
    Dir.rmdir(configus.tmp.path);
  end
end