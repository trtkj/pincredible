class Pin < ApplicationRecord
  belongs_to :users
  has_many :boards, through: :board_pins
end
