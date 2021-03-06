require 'dotenv'
Dotenv.load

require 'webmock/rspec'
WebMock.allow_net_connect!

require 'vcr'
VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.configure_rspec_metadata!
  config.hook_into :webmock
end

mode = ENV['MODE'] || 'unit'

$LOAD_PATH.unshift File.expand_path('..', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rspec'
require 'rack/test'
require 'faker'
require 'auth0'

Dir['./lib/**/*.rb'].each { |f| require f }
Dir['./spec/support/**/*.rb'].each { |f| require f }
Dir['./spec/support/*.rb'].each { |f| require f }

def entity_suffix
  'rubytest'
end

puts "Entity suffix is #{entity_suffix}"
puts "Running in mode #{mode}"

require_relative "spec_helper_#{mode}.rb"
