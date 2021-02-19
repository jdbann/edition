class EntryPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    Pundit.policy(account, record.entryable).update?
  end

  def destroy?
    record.account == account
  end
end
