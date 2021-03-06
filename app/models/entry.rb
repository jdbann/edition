class Entry < ApplicationRecord
  belongs_to :account
  delegated_type :entryable, types: %w[Message], dependent: :destroy

  scope :latest_first, -> { order(created_at: :desc) }
end
