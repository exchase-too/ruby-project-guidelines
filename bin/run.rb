
require_relative '../config/environment'
# require_relative '../app/models/car'
# require_relative '../app/models/purchase'
# require_relative '../app/models/user'
# require_relative '../app_cli'

@new_user_welcome = AppCLI.new()

    @new_user_welcome.welcome_message
    @new_user_welcome.get_user_name

    def welcome_super_user
        puts ""
        puts "Welcome Super User!"
        puts ""
    end

    def draw_prompt_table
        prompt = TTY::Prompt.new
        @analytic = prompt.select("Please select from the following options:", %w(AverageStarRating TotalInventory Exit))
    end

    def average_star_rating
        puts "This is the average star rating analytic"
    end
    
    def total_inventory
        Car.all.each_with_index do |car,index|
             puts "#{car.id} #{car.model}, Color: #{car.color}, Trim: #{car.trim_level}, Price:$#{sprintf("%.2f", car.price)}"
        end
    end

    def super_user_loop
        welcome_super_user
        draw_prompt_table
        while @analytic != "Exit"
            if @analytic == "AverageStarRating"
                average_star_rating
                draw_prompt_table
            elsif @analytic == "TotalInventory"
                total_inventory
                draw_prompt_table
            end
        end
    end    

    def regular_user
        @new_user_welcome.create_user
        @new_user_welcome.what_car_type
        @new_user_welcome.budget
        # @new_user_welcome.list_inventory
        # @new_user_welcome.select_a_car_from_inventory
        @new_user_welcome.what_color
        @new_user_welcome.what_trim_level
        @new_user_welcome.return_car
        @new_user_welcome.confirm_purchase
        @new_user_welcome.create_purchase
        @new_user_welcome.prompt_for_review
    end

    if AppCLI.new_user_name == "super_user"
        super_user_loop
    else
        regular_user
    end

    