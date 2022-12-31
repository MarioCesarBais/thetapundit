class ProntuarioPolicy < ApplicationPolicy
  attr_reader :user, :prontuario

  def initialize(user, prontuario)
    @user = user
    @prontuario = prontuario
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    @user.role = 'admin'
  end

  def show?
    @user.role = 'admin'
  end

  def new?
    debugger
    @user.role = 'admin'
  end

  def create?
    @user.role = 'admin'
  end

  def edit?
    @user.role = 'admin'
  end

  def update?
    @user.role = 'admin'
  end

  def destroy?
    @user.role = 'admin'
  end

end
