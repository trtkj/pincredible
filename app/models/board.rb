class Board < ApplicationRecord
  belongs_to :users
  has_many :pins, through: :board_pins
end
