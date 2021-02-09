class Message < ApplicationRecord
  include Entryable

  has_rich_text :content

  validates :content, presence: true
end
