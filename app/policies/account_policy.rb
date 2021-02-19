class AccountPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end
end
