class AppCLI

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

    def get_user
        print "Please enter your name, and we'll begin: "
        new_user_name = gets.chomp
        #if name = "super_user, do super_user_method"
        #def SU_method
        #welcome message
        #TTY input - select an analylitc
        @new_user = User.create(name: new_user_name)
        puts ""
        puts "Hello, #{@new_user.name}!  Let's get started!"
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
            @new_budget = 15000.00
        elsif temp == "$15,000-$30,000"
            @new_budget = 30000.00
        else
            @new_budget = 30000.01
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

    # def list_inventory
    #     puts "Here is our current inventory:"
    #     #Car.all.each_with_index do |car,index|
    #     Car.all.each do |car|
    #         puts "#{car.id} #{car.model}, Color: #{car.color}, Trim: #{car.trim_level}, Price:$#{sprintf("%.2f", car.price)}"
    #     end
    # end

    # def select_a_car_from_inventory
    #     puts ""
    #     puts "Select the number of your DREAM CAR:"
    #     inventory_id = gets.chomp
    #     @car = Car.find_by(id: inventory_id)
    #     puts "You've selected a #{@car.model}.  Nice choice!"
    #     # puts "Your bill with tax comes to $#{@car.price * 1.0825}."
    #     puts "Your bill with tax comes to $#{sprintf("%.2f", @car.price * 1.0825)}."
    # end
    
    def return_car
        @success_car = Car.all.find {|car| car.car_type==@new_car_type && car.price<=@new_budget && car.color==@new_color && car.trim_level==@new_trim_level}
        puts "SUCCESS!  Based on your search criteria, we've selected for you a #{@success_car.color} #{@success_car.model}, with #{@success_car.trim_level} trim package!"
        puts ""
        puts "The price is $#{@success_car.price}"
        puts ""
        puts "With tax, your total comes to $#{sprintf("%.2f", @success_car.price * 1.0825)}"
    end

    def confirm_purchase
        prompt = TTY::Prompt.new
        @confirm_new_purchase = prompt.select("Would you like to complete the transaction?", %w(Yes No))
    end

    def create_purchase
        if @confirm_new_purchase == "Yes"
            @new_purchase = Purchase.create(car_id: @success_car.id, user_id: @new_user.id)
            puts "Congratulations!  Enjoy your new car!"
        else
            puts "Oh well, try again to search for another car."
        end
    end

    def prompt_for_review
        prompt = TTY::Prompt.new
        review_yes = prompt.select("Would you like to leave a review of your experience at Flatiron Motors?", %w(Yes No))
        if review_yes == "Yes"
            prompt2 = TTY::Prompt.new
            review = prompt2.select("How many stars?", %w(1 2 3 4 5))
        else
            puts "Okay!"
        end
        puts "Thanks!  Goodbye!"
    end

end