class BookingPolicy < ApplicationPolicy
  def new?
    record.user == user
  end
  def create?
    record.user == user
  end
  def destroy?
    record.event.user == user
  end
  def update?
    record.user == user
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
