require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = {
    record: :once,
    match_requests_on: [:body, :headers]
  }
  config.filter_sensitive_data('<AWS_ACCESS_KEY_ID>') {ENV['AWS_ACCESS_KEY_ID']}
  config.filter_sensitive_data('<AWS_SECRET_KEY>') {ENV['AWS_SECRET_KEY']}
  config.filter_sensitive_data('<ASSOCIATE_TAG>') {ENV['ASSOCIATE_TAG']}
end
