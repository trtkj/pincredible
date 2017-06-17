class AddNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :avatar, :string
  end
end
