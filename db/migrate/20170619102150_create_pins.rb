class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.references :user, null: false
      t.text :description
      t.timestamps
    end
  end
end
