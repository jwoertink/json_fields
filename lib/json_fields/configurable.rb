module JsonFields
  module Configurable
    @@fields = {}
    # class User < ApplicationRecord
    #   json_field :settings, "Hash(String, String | Number)"
    #   json_field :likes, "Array(String)"
    # end
    def json_field(attribute, json_structure)
      @@fields[attribute] = JsonFields::ConfigurationParser.parse!(json_structure)
    end

    def json_fields
      @@fields
    end
  end
end
