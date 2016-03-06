class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :title
      t.text :text
      t.string :user_id

      t.timestamps null: false
    end
  end
end
