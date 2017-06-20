class Pin < ApplicationRecord
  belongs_to :users
  has_many :boards, through: :boards_pins
end
