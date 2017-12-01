class MessagePolicy < ApplicationPolicy
  def create?
    record.booking.user == user || record.booking.event.user == user
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
