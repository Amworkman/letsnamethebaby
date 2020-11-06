class CreateBabies < ActiveRecord::Migration[6.0]
  def change
    create_table :babies do |t|
      t.string :gender
      t.belongs_to :team
    end
  end
end
