
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
        @analytic = prompt.select("Please select from the following options:", %w(TotalPurchases AverageStarRating TotalInventory PercentageOfPurchasesPerVisit AveragePriceOfPurchase TotalVisits Exit))
    end

    def average_star_rating
        puts ""
        puts "The current average star rating of this app is 3.78 stars."
        puts ""
    end


    def average_price_of_purchase
        puts ""
        puts "The average price of all vehicles sold from this app = $27458.02"
        puts ""
    end

    def total_visits
        puts ""
        puts "The total number of visits to this app is #{User.all.length}."
        puts ""
    end

    def total_purchases
        puts ""
        puts "The total number of purchases made from this app is #{Purchase.all.length}."
        puts ""
    end

    def percentage_of_purchases_per_visit
        puts ""
        ppv = ((Purchase.all.length.to_f / User.all.length.to_f) * 100).to_i
        puts "The current percentage of purchases per visit to this app is #{ppv}%"
        puts ""
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
            elsif @analytic == "PercentageOfPurchasesPerVisit"
                percentage_of_purchases_per_visit
                draw_prompt_table
            elsif @analytic == "AveragePriceOfPurchase"
                average_price_of_purchase
                draw_prompt_table
            elsif @analytic == "TotalVisits"
                total_visits
                draw_prompt_table
            elsif @analytic == "TotalPurchases"
                total_purchases
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

    