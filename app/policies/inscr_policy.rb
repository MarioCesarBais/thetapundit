class InscrPolicy < ApplicationPolicy
  attr_reader :user, :inscr

  def initialize(user, inscr)
    @user = user
    @inscr = inscr
  end

  def new?
    @user.id.present?
  end

  def destroy?
    @user.id.present?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
