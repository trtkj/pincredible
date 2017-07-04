class PinTag < ApplicationRecord
  belongs_to :pin
  belongs_to :tag, counter_cache: true
  validates :pin_id, :tag_id, presence: true
  validate :alreadyTagged

  def alreadyTagged
    if PinTag.where(pin_id: pin_id, tag_id: tag_id).exists?
      errors[:base] << "既にタグ済みです"
    end
  end
end
