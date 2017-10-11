module JsonFields
  class ConfigurationParser

    # returns a Structure class based on the parsed data
    def self.parse!(data)
      data.match(/(\A[A-Z][A-Za-z]+)\(\w+\)/)
      raise JsonFields::ConfigurationError if $1.nil? &&$2.nil?
      klass = "JsonFields::#{$1}#{$2}Structure".safe_constantize
      raise JsonFields::ConfigurationError if klass.nil?
      klass.new
    end
  end
end
