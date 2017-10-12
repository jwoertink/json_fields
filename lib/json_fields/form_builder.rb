module JsonFields
  class FormBuilder < ActionView::Helpers::FormBuilder

    JsonFields::ApplicationHelper.instance_methods.each do |selector|
      src = <<-CODE
        def #{selector}(method, options = {})
          puts "\n\n ***FORM BUILDER*** \n\n"
          @template.send(#{selector.inspect}, @object_name, method, objectify_options(options))
        end
      CODE
      class_eval src, __FILE__, __LINE__
    end

    private

    def objectify_options(options)
      @default_options.merge(options.merge(:object => @object))
    end
  end
end
