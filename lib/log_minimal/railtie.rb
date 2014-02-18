module LogMinimal
  class Railtie < ::Rails::Railtie
    initializer 'log_minimal' do
      ActiveSupport.on_load :action_controller do
        include LogMinimal::Methods
      end
    end
  end
end
