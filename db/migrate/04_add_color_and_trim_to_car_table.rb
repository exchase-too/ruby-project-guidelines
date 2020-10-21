class AddColorAndTrimToCarTable < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :color, :string
    add_column :cars, :trim_level, :string
  end
end
