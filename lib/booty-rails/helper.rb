module BootyRails
  module Helper

    def form_for(object, options = {}, &block)
      puts "Helper::form_for"
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      super(object, options.reverse_merge!({builder: BootyRails::FormBuilder}), &block)
    end

    def form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      puts "Helper::form_with"
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      super(model, scope, url, format, options.reverse_merge!({builder: BootyRails::FormBuilder}), &block)
    end

  end
end

