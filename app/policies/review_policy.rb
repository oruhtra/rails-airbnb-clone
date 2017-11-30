class ReviewPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    true
  end

  def edit?
    update?
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
