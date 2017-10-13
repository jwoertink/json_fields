module JsonFields
  class ArraySimpleStructure < BaseStructure
    
    # `object_name` is a String snake_case name of the object
    # `method` is a Symbol of the method being called
    # `options` is a Hash. `options[:object]` contains the instance of the object
    # returns the HTML template to be used
    def template(object_name, method, options)
      obj = options[:object]
      id = [object_name, method, 'json_field'].join('_')

      content_tag(:div, id: id) do
        html = content_tag(:a, 'Add Field', href: '#', class: 'btn btn-add add-json-fields', 'data-target' => id)
        Array(obj.send(method)).collect.with_index { |value, idx|
          html += content_tag(:div, class: ['template', options.delete(:wrapper_class)].compact.join(' ')) do
            [text_field_tag("#{object_name}[#{method}][]", nil, value: value, class: 'json-field-control', id: nil, name: "#{object_name}[#{method}][]"),
             content_tag(:a, '-', href: '#', class: 'btn btn-remove remove-json-fields')
            ].join.html_safe
          end
        }
        html.html_safe
      end

    end

    # Takes in values and returns a normal structure that can be saved
    def assemble(values)
      values
    end
  end
end
