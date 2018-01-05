module BootyRails
  module Helper

    def form_for(object, options = {}, &block)
      puts "Helper::form_for"
      ActionView::Base.field_error_proc = proc { |input, instance| input }
      super(object, options.reverse_merge!({builder: BootyRails::FormBuilder}), &block)
    end

    def form_with(**options)
      puts "Helper::form_with"
      ActionView::Base.field_error_proc = proc { |input, instance| input }

      options.reverse_merge!({builder: BootyRails::FormBuilder})

      options[:allow_method_names_outside_object] = true
      options[:skip_default_ids] = true

      if options[:model]
        options[:url] ||= polymorphic_path(options[:model], format: options[:format])

        options[:model]   = options[:model].last if options[:model].is_a?(Array)
        options[:scope] ||= model_name_from_record_or_class(options[:model]).param_key
      end

      if block_given?
        builder = instantiate_builder(options[:scope], options[:model], options)
        output  = capture(builder, &Proc.new)
        options[:multipart] ||= builder.multipart?

        html_options = html_options_for_form_with(options[:url], options[:model], options)
        super(options) do
          capture(&Proc.new)
        end
      end


    end

  end
end

