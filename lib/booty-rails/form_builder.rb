module BootyRails

  class FormBuilder < ActionView::Helpers::FormBuilder

    delegate :content_tag, :capture, :concat, to: :@template

    def initialize(object_name, object, template, options)
      puts 'FormBuilder::initialize'
      super
    end

    def email_field(name, **options, &block)
      super(name, options)
    end

  end
end