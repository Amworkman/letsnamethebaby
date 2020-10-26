class CreateBabyNames < ActiveRecord::Migration[6.0]
  def change
    create_table :baby_names, id: false do |t|
      t.string :name
      t.string :origin
      t.string :gender
      t.string :meaning
      t.string :variations
    end
  end
end
