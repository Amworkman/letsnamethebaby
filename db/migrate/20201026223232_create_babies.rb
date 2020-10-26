class CreateBabies < ActiveRecord::Migration[6.0]
  def change
    create_table :babies do |t|
      t.string :gender
      t.belongs_to :parent
      t.belongs_to :baby_name
    end
  end
end
