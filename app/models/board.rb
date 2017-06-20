class Board < ApplicationRecord
  belongs_to :users
  has_many :pins, through: :boards_pins
end
