require_relative '../lib/active_json'

module MyDatabase
  extend ActiveJson::Base

  configure do |config|
    config.path = File.join(__dir__, 'my_database.json')
    config.readonly = false
  end
end
