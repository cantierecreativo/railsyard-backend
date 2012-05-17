module FormHelper

  def backend_form_for(object, *args, &block)
    require 'railsyard-backend/form_builder'
    options = args.extract_options!
    simple_form_for(object, *(args << options.merge(:builder => Railsyard::Backend::FormBuilder)), &block) << after_nested_form_callbacks
  end


  def after_nested_form(association, &block)
    @associations ||= []
    @after_nested_form_callbacks ||= []
    unless @associations.include?(association)
      @associations << association
      @after_nested_form_callbacks << block
    end
  end

  def edit_field_visible?(field, resource)
    if field.visible.respond_to?(:call)
      field.visible.call(resource, self)
    else
      field.visible
    end
  end

  def edit_field_options(field, resource)
    options = {}
    options[:as] = field.field_type if field.field_type.present?

    if field.input_options.respond_to?(:call)
      options = options.merge field.input_options.call(resource, self)
    else
      options = options.merge field.input_options
    end

    options
  end

  private

  def after_nested_form_callbacks
    @after_nested_form_callbacks ||= []
    fields = @after_nested_form_callbacks.map do |callback|
      callback.call
    end
    fields.join(" ").html_safe
  end

end
