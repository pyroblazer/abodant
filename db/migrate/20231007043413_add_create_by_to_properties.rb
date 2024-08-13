class AddCreateByToProperties < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :created_by, :integer
  end
end
