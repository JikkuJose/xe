require 'minitest/autorun'
require 'minitest/reporters'
require 'webmock/minitest'
require 'vcr'

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new({detailed_skip: false})

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures"
  c.hook_into :webmock
end
