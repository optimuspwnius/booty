module BootyRails
  class FormBuilder < ActionView::Helpers::FormBuilder
    #extend BootstrapForm::Aliasing
    #include BootstrapForm::Helpers::Bootstrap

    #delegate :content_tag, :capture, :concat, to: :@template

    def initialize(object_name, object, template, options)
      puts "Hello!"
    end


    def form_for(object, options = {}, &block)
      options.reverse_merge!({builder: BootyRails::FormBuilder})

        ActionView::Base.field_error_proc = proc { |input, instance| input }

        super(object, options, &block)

    end

  end
end