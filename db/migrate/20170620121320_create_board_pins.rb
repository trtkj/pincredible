class CreateBoardPins < ActiveRecord::Migration[5.0]
  def change
    create_table :board_pins do |t|
      t.references :board, index: true, null: false
      t.references :pin, index: true, null: false
      t.timestamps
    end
  end
end
