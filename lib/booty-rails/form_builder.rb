module BootyRails

  class FormBuilder < ActionView::Helpers::FormBuilder

    def initialize(object_name, object, template, options)
      puts "Hello!"
      super
    end




  end
end