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

    def default_options
      {
          layout: :horizontal,
          control_only: false,
          label_only: false,
          form_group_only: false,
          skip_control: false,
          skip_label: false,
          skip_form_group: false,
          has_errors: false,
          is_addon: false,
          label_class: '',
          form_group_class: '',
          errors: []
      }
    end

    def control_options(options)
      options.to_options!
      puts 'FormBuilder::control_options'
      _options = options.except(default_options)
      options.slice!(default_options)
      options.reverse_merge!(default_options)
      puts _options
      _options
    end

    def text_field(name, **options, &block)
      puts "FormBuilder::text_field: #{name}"
      form_group(name, super(name, control_options(options)), options)
    end

    def form_group(name, control, options)
      puts 'FormBuilder::form_group'
      puts 'FormBuilder::form_group:options'
      puts options
      label = label(object_name, class: options[:label_class]) unless options[:skip_label]
      control = nil if options[:skip_control]

      if options[:control_only]
        control
      elsif options[:label_only]
        label
      elsif options[:form_group_only]
        content_tag(:div, nil, class: "form-group #{options[:form_group_class]}")
      elsif options[:skip_form_group]
        label + control
      end

      content_tag(:div, label + control, class: "form-group #{options[:form_group_class]}")
    end

    def has_error?(name)
      object.respond_to?(:errors) and object.errors[name].present?
    end

    def get_error_messages(name)
      object.errors.full_messages_for(name).join(', ')
    end


  end
end