module BootyRails
  module Helper

    def form_for(object, options = {}, &block)
      options.reverse_merge!({builder: BootyRails::FormBuilder})
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      super(object, options, &block)
    end

  end
end