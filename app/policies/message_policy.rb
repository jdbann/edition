class MessagePolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.entry.account == account
  end
end
