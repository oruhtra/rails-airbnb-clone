class ReviewPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end
end
