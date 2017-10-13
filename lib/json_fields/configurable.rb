module JsonFields
  module Configurable
    @@fields = {}

    def json_field(attribute, json_structure)
      @@fields[attribute] = JsonFields::ConfigurationParser.parse!(json_structure)
      define_method("#{attribute}=") do |values|
        value = self.class.json_fields[attribute].assemble(values)
        self.write_attribute(attribute, value)
      end
    end

    def json_fields
      @@fields
    end
  end
end
