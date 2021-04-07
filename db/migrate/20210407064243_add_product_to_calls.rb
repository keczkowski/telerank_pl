class AddProductToCalls < ActiveRecord::Migration[6.0]
  def change
    add_column :calls, :product, :string
  end
end
