class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :imie
      t.string :nazwisko
      t.string :numer_telefonu
      t.string :email
      t.string :miasto
      t.string :kod
      t.string :adres

      t.timestamps
    end
  end
end
