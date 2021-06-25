class ChangeImageProductidToInteger < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :product_id, :string
    add_column :images, :product_id, :integer
  end
end
