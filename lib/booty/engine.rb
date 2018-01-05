require 'bootstrap'

module BootyRails


  class Engine < ::Rails::Engine
    initializer 'booty_rails.initialize' do

        require 'bootstrap'

    end
  end
end