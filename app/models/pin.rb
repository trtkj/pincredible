class Pin < ApplicationRecord
  belongs_to :user
  has_many :boards, through: :board_pins
  has_many :board_pins
  validates :title, presence: true
  validates :image, presence: true
  validates :user_id, presence: true
  mount_uploader :image, ImageUploader
end
