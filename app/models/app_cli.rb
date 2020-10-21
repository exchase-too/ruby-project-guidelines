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
        new_user = User.create(name: new_user_name)
        puts ""
        puts "Hello, #{new_user.name}!  Let's get started!"
        puts ""
    end

    def what_car_type
        prompt = TTY::Prompt.new
        new_car_type = prompt.select("What kind of car are you looking for?", %w(Sedan Coupe Minivan Truck))
    end

    def budget
        prompt = TTY::Prompt.new
        new_budget = prompt.select("What is your budget?", %w($0-$10,000 $10,000-$20,000 $20,000-$30,000 $30,000-$40,000 >$40,000))
        binding.pry
    end

    def list_inventory
        puts "Here is our current inventory:"
    
        Car.all.each_with_index do |car,index|
            puts "#{car.id}: #{car.model} - $#{sprintf("%.2f", car.price)}"
        end
    end
     
    def select_a_car_from_inventory
        puts ""
        puts "Select the number of your DREAM CAR:"
        inventory_id = gets.chomp
        @car = Car.find_by(id: inventory_id)
        puts "You've selected a #{@car.model}.  Nice choice!"
        # puts "Your bill with tax comes to $#{@car.price * 1.0825}."
        puts "Your bill with tax comes to $#{sprintf("%.2f", @car.price * 1.0825)}."
        
        # total = @car.price * 1.0825
        # binding.pry
        # temp = number_to_currency(total)
        # binding.pry
        # puts "Your bill with tax comes to $#{@temp}."
    end

end