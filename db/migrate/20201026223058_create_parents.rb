class CreateParents < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :roll
      t.belongs_to :team
      t.belongs_to :baby
    end
  end
end
