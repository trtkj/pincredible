class AddCounterToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :board_pins_count, :integer, default: 0
  end
end
