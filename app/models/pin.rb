class Pin < ApplicationRecord
  belongs_to :user
  has_many :boards, through: :board_pins
  has_many :board_pins
  has_many :tags, through: :pin_tags
  has_many :pin_tags
  validates :title, :image, :user_id, presence: true
  mount_uploader :image, ImageUploader
end
