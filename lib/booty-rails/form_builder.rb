module BootyRails

  class FormBuilder < ActionView::Helpers::FormBuilder

    def initialize(object_name, object, template, options)
      puts 'FormBuilder::initialize'
      super
    end

  end
end