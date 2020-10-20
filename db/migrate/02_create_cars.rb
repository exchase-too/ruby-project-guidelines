class CreateCars < ActiveRecord::Migration[5.2]
    def change
        create_table :cars do |t|
            t.string :model
            t.integer :price
            t.string :car_type
        end
    end
end
