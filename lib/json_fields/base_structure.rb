module JsonFields
  class BaseStructure
    include ActionView::Context
    include ActionView::Helpers::FormTagHelper
    include ActionView::Helpers::TagHelper

    attr_accessor :allow_blank

    def initialize(options)
      @allow_blank = options[:allow_blank] || false
    end

    def template(object_name, method, options)
      raise "template must be defined in the subclass"
    end

    def assemble(values)
      raise "assemble must be defined in the subclass"
    end
  end
end
