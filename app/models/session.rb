class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, :password, presence: true
  validate :password_is_correct

  def account
    return unless valid?

    @account ||= account_for_email
  end

  private

  def account_for_email
    @account_for_email ||= Account.find_by(email: email)
  end

  def password_is_correct
    return if account_for_email.present? && account_for_email.authenticate(password)

    errors.add(:base, :email_and_password_not_recognised)
  end
end
