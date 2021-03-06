require 'benchmark'
require 'awesome_print'

require 'json'
require 'ostruct'

require_relative 'active_json/array'
require_relative 'active_json/object'
require_relative 'active_json/base'

module ActiveJson
  STRUCTURES = [ActiveJson::Array, ActiveJson::Object].freeze

  class ReadOnlyDatabase < StandardError
    def initialize(*)
      super("Can't modify readonly database.")
    end
  end
end
