class AddWstepZakonczenieToScreenplays < ActiveRecord::Migration[6.0]
  def change
    add_column :screenplays, :prelude, :text
    add_column :screenplays, :ending, :text
  end
end
