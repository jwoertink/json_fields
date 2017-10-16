module JsonFields
  class HashSimpleStructure < BaseStructure

    def template(object_name, method, options)
      obj = options[:object]
      id = [object_name, method, 'json_field'].join('_')

      content_tag(:div, id: id) do
        html = content_tag(:a, 'Add Field', href: '#', class: 'btn btn-add add-json-fields', 'data-target' => id)
        Hash(obj.send(method)).merge({""=>""}).collect.with_index { |(key, value), idx|
          html += content_tag(:div, class: ['template', options.delete(:wrapper_class)].compact.join(' ')) do
            [
              text_field_tag("#{object_name}[#{method}][key][]", nil, value: key, class: 'json-field-control', id: nil),
              text_field_tag("#{object_name}[#{method}][value][]", nil, value: value, class: 'json-field-control', id: nil),
             content_tag(:a, '-', href: '#', class: 'btn btn-remove remove-json-fields')
            ].join.html_safe
          end
        }
        html.html_safe
      end

    end

    # {key: [], value: []} assemble this
    # {"a" => 1} passthrough this
    def assemble(values)
      if values.is_a?(Hash) && (values.keys & [:key, :value]).any?
        if allow_blank
          Hash[values[:key].zip(values[:value])]
        else
          keys = values[:key].delete_if(&:blank?)
          vals = values[:value].delete_if(&:blank?)
          Hash[keys.zip(vals)]
        end
      else
        values
      end
    end
  end
end
