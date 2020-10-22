class AddReviewColumnToUsersModel < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reviews, :integer
  end
end
