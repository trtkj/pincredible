class BoardPin < ApplicationRecord
  belongs_to :board, counter_cache: true
  belongs_to :pin, counter_cache: true
end
