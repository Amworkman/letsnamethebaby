class CreateParentsBabyNames < ActiveRecord::Migration[6.0]
  def change
    create_table :parents_baby_names do |t|
      t.belongs_to :parent
      t.belongs_to :baby_name
      t.timestamps
    end
  end
end
