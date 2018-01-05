require 'bootstrap'

module BootyRails
  
  class Engine < ::Rails::Engine
    config.booty_rails = BootyRails::Configuration.new
    isolate_namespace BootyRails

    initializer 'booty_rails.action_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        ::ActionController::Base.helper(BootyRails::ApplicationHelper)
      end
    end

    initializer "booty_rails.form_builder" do
      ActionView::Helpers::FormBuilder.send(:include, BootyRails::FormHelper)
    end
  end
end