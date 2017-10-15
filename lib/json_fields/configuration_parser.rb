module JsonFields
  class ConfigurationParser

    # returns a Structure class based on the parsed data
    def self.parse!(data, options = {})
      data.match(/(\A[A-Z][A-Za-z]+)\((\w+)\)/)
      raise JsonFields::ConfigurationError.new("Configuration data is incorrect: #{data}") if $1.nil? || $2.nil?
      klass = "JsonFields::#{$1}#{$2}Structure".safe_constantize
      raise JsonFields::ConfigurationError.new("No Structure found") if klass.nil?
      klass.new(options)
    end
  end
end
