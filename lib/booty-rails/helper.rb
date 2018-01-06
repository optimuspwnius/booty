module BootyRails
  module Helper

    def form_for(object, options = {}, &block)
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      super(object, options.reverse_merge!({builder: BootyRails::FormBuilder}), &block)
    end

    def form_with(model: nil, scope: nil, url: nil, format: nil, **options, &block)
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      super(model: model, scope: scope, url: url, format: format, **options.reverse_merge!({builder: BootyRails::FormBuilder}), &block)
    end

  end
end

