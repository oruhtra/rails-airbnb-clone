class UserPolicy < ApplicationPolicy
  def show?
    user == record || record.status
  end

  def edit?
    record == user
  end
  def update?
    record == user
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
