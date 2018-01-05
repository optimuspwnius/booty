require 'bootstrap'
require 'booty-rails/form_builder'
require 'booty-rails/helper'

module BootyRails
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end

ActiveSupport.on_load(:action_view) do
  include BootyRails::Helper
end