class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :house
      t.string :role
      t.string :wand
      t.string :bloodstatus

      t.timestamps
    end
  end
end
