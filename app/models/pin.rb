class Pin < ApplicationRecord
  belongs_to :user
  has_many :boards, through: :board_pins
  has_many :board_pins
  has_many :tags, through: :pin_tags
  has_many :pin_tags
  validates :title, :image, :user_id, presence: true
  mount_uploader :image, ImageUploader

  def extract_tags
    oldPinTags = PinTag.where(pin_id: self.id)
    oldPinTags.each do |pintag|
      pintag.destroy
    end
    tags = self.description.scan(/#([^(\s|#)]+)\s?/)
    tags.each do |tag|
      newTag = Tag.where(name: tag).first_or_initialize
      newTag.save
      PinTag.create(tag_id: newTag.id, pin_id: self.id)
    end
  end
end
