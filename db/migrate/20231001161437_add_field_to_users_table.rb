class AddFieldToUsersTable < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :current_role, :string
  end
end
