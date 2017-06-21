class Pin < ApplicationRecord
  belongs_to :users
  has_many :boards, through: :board_pins
  validates :title, presence: true
  validates :image, presence: true
  validates :user_id, presence: true
end
