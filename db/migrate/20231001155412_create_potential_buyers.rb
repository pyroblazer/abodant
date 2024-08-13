class CreatePotentialBuyers < ActiveRecord::Migration[7.1]
  def change
    create_table :potential_buyers do |t|
      t.integer :user_id
      t.integer :property_id
      t.timestamps
    end
  end
end
