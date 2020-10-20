

require_relative '../config/environment'
# require_relative '../app/models/car'
# require_relative '../app/models/purchase'
# require_relative '../app/models/user'
# require_relative '../app_cli'

#puts "HELLO WORLD"

new_user_welcome = AppCLI.new()
new_user_welcome.welcome_message
new_user_welcome.list_inventory



