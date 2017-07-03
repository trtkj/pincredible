class BoardPin < ApplicationRecord
  belongs_to :board, counter_cache: true
  belongs_to :pin, counter_cache: true
  validates :pin_id, :board_id, presence: true
  validate :alreadySaved

  def alreadySaved
    if BoardPin.where(pin_id: pin_id, board_id: board_id).exists?
      errors[:base] << "既に保存済みです"
    end
  end
end
