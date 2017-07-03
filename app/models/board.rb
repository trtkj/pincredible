class Board < ApplicationRecord
  belongs_to :user
  has_many :pins, through: :board_pins
  has_many :board_pins
  validates :title, :user_id, presence: true
end
