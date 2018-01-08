module BootyRails

  class FormBuilder < ActionView::Helpers::FormBuilder

    delegate :content_tag, :capture, :concat, to: :@template

    def initialize(object_name, object, template, options)
      puts 'FormBuilder::initialize'
      super(object_name, object, template, options)
    end

    def email_field(name, **options, &block)
      puts 'FormBuilder::email_field'
      super(name, options)
    end

    def fieldset(name, &block)
      puts 'FormBuilder::fieldset'
      capture(&block)
    end

    def input_options(options)
      puts 'FormBuilder::input_options'
      puts options
      options
    end

    def text_field(name, **options, &block)
      puts "FormBuilder::text_field: #{name}"
      form_group(name, super(name, input_options(options)), options)
    end

    def form_group(name, control, options)
      puts 'FormBuilder::form_group'
      label = label(object_name)

      content_tag(:div, label + control, options)
    end

    def has_error?(name)
      object.respond_to?(:errors) and object.errors[name].present?
    end

    def get_error_messages(name)
      object.errors.full_messages_for(name).join(', ')
    end


  end
end