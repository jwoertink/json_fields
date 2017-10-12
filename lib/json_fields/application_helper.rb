module JsonFields
  module ApplicationHelper

    def json_field(object_name, method, options = {})
      puts "\n\n ***HELPER*** \n\n"
      if options[:class].blank?
        options[:class] = 'json-field'
      else
        options[:class] += ' json-field'
      end
      text_field(object_name, method, options)
    end

  end
end
