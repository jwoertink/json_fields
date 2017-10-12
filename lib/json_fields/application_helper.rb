module JsonFields
  module ApplicationHelper

    def json_field(object_name, method, options = {})
      klass = options[:object].class
      if options[:class].blank?
        options[:class] = 'json-field'
      else
        options[:class] += ' json-field'
      end
      klass.json_fields[method].template(object_name, method, options)
    end

  end
end
