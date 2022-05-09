class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :tags

      t.timestamps null: false
    end
  end
end
