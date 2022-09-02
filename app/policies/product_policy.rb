class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
