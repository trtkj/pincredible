class Tag < ApplicationRecord
  has_many :pins, through: :pin_tags
  has_many :pin_tags
  validates :name, presence: true

end
