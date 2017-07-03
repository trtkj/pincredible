class CreatePinTags < ActiveRecord::Migration[5.0]
  def change
    create_table :pin_tags do |t|
      t.references :pin, null: false
      t.references :tag, null: false
      t.timestamps
    end
  end
end
