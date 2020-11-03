class AddColumnsToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :parent_name, :string
    add_column :teams, :email, :string
  end
end
