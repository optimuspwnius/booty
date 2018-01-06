module BootyRails
  module Helper

    def form_for(object, options = {}, &block)
      puts "Helper::form_for"
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      super(object, options.reverse_merge!({builder: BootyRails::FormBuilder}), &block)
    end

    def form_with(model: nil, scope: nil, url: nil, format: nil, **options)
      puts "Helper::form_with"
      ActionView::Base.field_error_proc = proc { |input, instance| input }

      options.reverse_merge!({builder: BootyRails::FormBuilder})
      puts 'Options:'
      puts options

      super(model: model, scope: scope, url: url, format: format, **options, &block) do
        Proc.new.call
      end

    end

    def form_with_works(model: nil, scope: nil, url: nil, format: nil, **options)
      puts "Helper::form_with"
      ActionView::Base.field_error_proc = proc { |input, instance| input }

      options.reverse_merge!({builder: BootyRails::FormBuilder})
      puts 'Options:'
      puts options

      model   = model.last if model.is_a?(Array)
      scope ||= model_name_from_record_or_class(model).param_key
      builder = instantiate_builder(scope, model, options)
      output  = capture(builder, &Proc.new)

      super(options) do
        output
      end

    end

  end
end

