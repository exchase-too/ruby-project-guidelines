class AppCLI

    @@new_user_name = nil

    def self.new_user_name
        @@new_user_name
    end

    def welcome_message
        puts
        puts "░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗  ████████╗░█████╗░"
        puts "░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝  ╚══██╔══╝██╔══██╗"
        puts "░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░  ░░░██║░░░██║░░██║"
        puts "░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░  ░░░██║░░░██║░░██║"
        puts "░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗  ░░░██║░░░╚█████╔╝"
        puts "░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝  ░░░╚═╝░░░░╚════╝░"
        puts ""
        puts "███████╗██╗░░░░░░█████╗░████████╗██╗██████╗░░█████╗░███╗░░██╗  ███╗░░░███╗░█████╗░████████╗░█████╗░██████╗░░██████╗"
        puts "██╔════╝██║░░░░░██╔══██╗╚══██╔══╝██║██╔══██╗██╔══██╗████╗░██║  ████╗░████║██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔════╝"
        puts "█████╗░░██║░░░░░███████║░░░██║░░░██║██████╔╝██║░░██║██╔██╗██║  ██╔████╔██║██║░░██║░░░██║░░░██║░░██║██████╔╝╚█████╗░"
        puts "██╔══╝░░██║░░░░░██╔══██║░░░██║░░░██║██╔══██╗██║░░██║██║╚████║  ██║╚██╔╝██║██║░░██║░░░██║░░░██║░░██║██╔══██╗░╚═══██╗"
        puts "██║░░░░░███████╗██║░░██║░░░██║░░░██║██║░░██║╚█████╔╝██║░╚███║  ██║░╚═╝░██║╚█████╔╝░░░██║░░░╚█████╔╝██║░░██║██████╔╝"
        puts "╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝  ╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝╚═════╝░"
        puts ""
    end

    def get_user_name
        print "Please enter your name, and we'll begin: "
        @@new_user_name = gets.chomp
    end

    def create_user
        # @new_user = User.create(name: @@new_user_name, review: 3)
        @new_user = User.create(name: @@new_user_name)

        puts ""
        puts "Hello, #{@@new_user_name}!  Let's get started!"
        puts ""
    end

    def what_car_type
        prompt = TTY::Prompt.new
        @new_car_type = prompt.select("What kind of car are you looking for?", %w(Sedan Coupe Minivan Truck))
    end

    def budget
        prompt = TTY::Prompt.new
        temp = prompt.select("What is your budget?", %w($0-$15,000 $15,000-$30,000 >$30,000))
        if temp == "$0-$15,000"
            @new_budget_min = 0.00
            @new_budget_max = 15000.00
        elsif temp == "$15,000-$30,000"
            @new_budget_min = 15000.01
            @new_budget_max = 30000.00
        else
            @new_budget_min = 30000.01
            @new_budget_max = 100000000.00
        end
        puts ""
    end

    def what_color
        prompt = TTY::Prompt.new
        @new_color = prompt.select("Okay!  We have #{@new_car_type}s in three colors!  What color would you like?", %w(Red Black White))
        puts ""
    end

    def what_trim_level
        prompt = TTY::Prompt.new
        @new_trim_level = prompt.select("And finally, what level of trim would you like?", %w(Base Deluxe))
        puts ""
        puts "Okay, we have everything we need!  Searching...."
        puts ""
    end
    
    def return_car
        @success_car = Car.all.find {|car| car.car_type==@new_car_type && car.price >= @new_budget_min && car.price<=@new_budget_max && car.color==@new_color && car.trim_level==@new_trim_level}
        puts "SUCCESS!  Based on your search criteria, we've selected for you a #{@success_car.color} #{@success_car.model}, with #{@success_car.trim_level} trim package!"
        puts ""
        puts "The price is $#{sprintf("%.2f", @success_car.price)}"
        puts ""
        puts "With tax, your total comes to $#{sprintf("%.2f", @success_car.price * 1.0825)}"
        puts ""
    end

    def confirm_purchase
        prompt = TTY::Prompt.new
        @confirm_new_purchase = prompt.select("Would you like to complete the transaction?", %w(Yes No))
        puts ""
    end

    def create_purchase
        if @confirm_new_purchase == "Yes"
            @new_purchase = Purchase.create(car_id: @success_car.id, user_id: @new_user.id)
            puts "Congratulations #{@@new_user_name}!  Enjoy your new car!"
            puts ""
        else
            puts "Oh well, try again to search for another car."
            puts ""
        end
    end

    def prompt_for_review
        puts "Please leave a review of your experience at Flatiron Motors!"
        puts ""
        prompt = TTY::Prompt.new
        review = prompt.select("How many stars?", %w(1 2 3 4 5))
        # @new_user.review = prompt.select("How many stars?", %w(1 2 3 4 5)).to_i
        puts ""
        puts "Thanks!  Goodbye!"
    end

end