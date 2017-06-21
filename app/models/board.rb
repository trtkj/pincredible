class Board < ApplicationRecord
  belongs_to :users
  has_many :pins, through: :board_pins
  validates :title, presence: true
  validates :user_id, presence: true
end
