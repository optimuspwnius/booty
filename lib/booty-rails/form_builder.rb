module BootyRails

  class FormBuilder < ActionView::Helpers::FormBuilder

    delegate :content_tag, :capture, :concat, to: :@template

    def initialize(object_name, object, template, options)
      puts 'FormBuilder::initialize'
      super
    end

    def email_field(name, **options, &block)
      puts 'FormBuilder::email_field'
      super(name, options)
    end

    def fieldset(name, &block)
      puts 'FormBuilder::fieldset'
      yield
    end

  end
end