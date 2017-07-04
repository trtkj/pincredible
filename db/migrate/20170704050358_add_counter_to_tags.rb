class AddCounterToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :pin_tags_count, :integer, default: 0
  end
end
