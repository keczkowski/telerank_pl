class AddCityToCalls < ActiveRecord::Migration[6.0]
  def change
    add_column :calls, :city, :string
  end
end
