class Account < ApplicationRecord
  has_many :entries
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
end
