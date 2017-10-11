require "active_record"
require "active_record/version"
require "active_support/core_ext/module"
require "json_fields/errors"
require "json_fields/array_simple_structure"
require "json_fields/hash_simple_structure"
require "json_fields/configuration_parser"
require "json_fields/configurable"
require "json_fields/engine"
require "json_fields/version"

module JsonFields
  
end

ActiveSupport.on_load(:active_record) do
  extend JsonFields::Configurable
end
