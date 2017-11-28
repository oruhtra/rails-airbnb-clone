class EventPolicy < ApplicationPolicy

  def show?
    user == record
  end
  def create?
    return true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
