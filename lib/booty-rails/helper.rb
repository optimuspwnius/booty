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
      super(options.reverse_merge!({builder: BootyRails::FormBuilder})) do
        capture(&Proc.new)
      end
    end

  end
end

