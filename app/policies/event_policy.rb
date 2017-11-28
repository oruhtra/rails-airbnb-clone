class EventPolicy < ApplicationPolicy

  def show?
    record.user == user
  end
  def create?
    return true
  end
  def destroy?
    record.user == user
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
