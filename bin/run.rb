
require_relative '../config/environment'
# require_relative '../app/models/car'
# require_relative '../app/models/purchase'
# require_relative '../app/models/user'
# require_relative '../app_cli'

new_user_welcome = AppCLI.new()
new_user_welcome.welcome_message
new_user_welcome.get_user_name
new_user_welcome.create_user
new_user_welcome.what_car_type
new_user_welcome.budget
# new_user_welcome.list_inventory
# new_user_welcome.select_a_car_from_inventory
new_user_welcome.what_color
new_user_welcome.what_trim_level
new_user_welcome.return_car
new_user_welcome.confirm_purchase
new_user_welcome.create_purchase
new_user_welcome.prompt_for_review