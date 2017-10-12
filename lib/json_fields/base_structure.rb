module JsonFields
  class BaseStructure
    include ActionView::Context
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::TagHelper

    def template(object_name, method, options)
      raise "template must be defined in the subclass"
    end
  end
end
