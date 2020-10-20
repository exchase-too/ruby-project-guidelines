class CreatePurchases < ActiveRecord::Migration[5.2]
    def change
        create_table :purchases do |t|
            t.integer :car_id
            t.integer :user_id
        end
    end
end
