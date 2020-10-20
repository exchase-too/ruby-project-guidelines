class User < ActiveRecord::Base 
    has_many :cars, through: :purchases
end
