module JsonFields
  class ArraySimpleStructure < BaseStructure
    
    # `object_name` is a String snake_case name of the object
    # `method` is a Symbol of the method being called
    # `options` is a Hash. `options[:object]` contains the instance of the object
    # returns the HTML template to be used
    def template(object_name, method, options)
      obj = options[:object]
      content_tag(:div, id: [object_name, method, 'json_field'].join('_')) do
        html = content_tag(:a, 'Add Field', href: '#', class: 'btn btn-add add-json-fields', 'data-target' => [object_name, method, 'json_field'].join('_'))
        Array(obj.send(method)).collect { |value|
          html += content_tag(:div, class: 'template ' + options.delete(:wrapper_class)) do
            text_field_tag("#{object_name}[#{method}][]", nil, value: value, class: 'json-field-control') 
          end
        }
        html.html_safe
      end

    end
  end
end
