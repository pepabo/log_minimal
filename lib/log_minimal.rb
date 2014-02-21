require 'log_minimal/configuration'
require 'log_minimal/methods'

if defined?(::Rails::Railtie)
  require 'log_minimal/railtie'
end
