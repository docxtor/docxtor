if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start
end

require 'rspec-xml'
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
    Dir.mkdir(Docxtor2::Tests::TMP_PATH, Docxtor2::Tests::TMP_PERMISSIONS)
  end
  config.after(:all) do
    Dir.rmdir(Docxtor2::Tests::TMP_PATH);
  end
end