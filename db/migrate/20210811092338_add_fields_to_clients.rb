class AddFieldsToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :zainteresowanie_usluga, :string
    add_column :clients, :zrodlo, :string
  end
end
