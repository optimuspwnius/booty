require 'bootstrap'
require 'booty-rails/form_builder'

module BootyRails
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end

ActiveSupport.on_load(:action_view) do

  def form_for(object, options = {}, &block)
    puts "Helper::form_for"
    ActionView::Base.field_error_proc = proc { |input, instance| input }
    super(object, options.reverse_merge!({builder: BootyRails::FormBuilder}), &block)
  end

end