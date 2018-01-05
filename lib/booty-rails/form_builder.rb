module BootyRails

  class FormBuilder < ActionView::Helpers::FormBuilder

    def initialize(object_name, object, template, options)
      options[:html][:cool] = "yup"
      puts "Hello!"
      super
    end




  end
end