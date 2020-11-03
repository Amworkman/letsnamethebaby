class AddColumnsToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :provider, :string
    add_column :teams, :uid, :string
  end
end
