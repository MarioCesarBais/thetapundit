class AdmPolicy < ApplicationPolicy
  attr_reader :user, :agendada

  def initialize(user, record)
    @user = user
    @record = record
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def criar_cliente?
    @user.role == 'admin'
  end

  def inserir_cliente?
    @user.role == 'admin'
  end

  def escolher_cliente?
    @user.role == 'admin'
  end

end
