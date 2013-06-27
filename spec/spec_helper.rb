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

['matchers', 'contexts', 'examples'].each do |dir|
  dir_pattern = File.join(File.dirname(__FILE__),
    'docxtor2', 'support', dir, '**', '*.rb')
  Dir[File.expand_path(dir_pattern)].each { |f| require f }
end

RSpec.configure do |config|
  config.before(:all) do
    Dir.mkdir(Docxtor2::Known::Path::TMP, 0700)
  end

  config.after(:all) do
    FileUtils.rm_rf(Docxtor2::Known::Path::TMP)
  end
end
