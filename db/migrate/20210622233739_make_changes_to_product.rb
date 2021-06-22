class MakeChangesToProduct < ActiveRecord::Migration[6.1]
  def change
    change_column :products, :price, :decimal, precision: 12, scale: 2
    add_column :products, :amount_in_inventory, :integer
  end
end
