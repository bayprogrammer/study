class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.references :todo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
