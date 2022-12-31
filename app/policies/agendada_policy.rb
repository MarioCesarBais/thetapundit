class AgendadaPolicy < ApplicationPolicy
  attr_reader :user, :agendada

  def initialize(user, agendada)
    @user = user
    @agendada = agendada
  end

  def index?
    @user.role == 'admin' || @agendada.select { |agendada| agendada.user == @user.id }.present?
  end

  def agendar?
    @user.present?
  end

  def create?
    @user.role == 'admin'
  end

  def distribui?
    @user.id.present?
  end

  def marcar?
    @user.id.present?
  end

  def edit?
    @user.role == 'admin'
  end

  def destroy?
    @user.role == 'admin'
  end

  def anotar?
    @user.role == 'admin'
  end

  def gravar?
    @user.role == 'admin'
  end

  def escolher_cliente?
    @user.role == 'admin'
  end

  def UserPolicy
    @user.role == 'admin'
  end
  
  class Scope < Scope
    attr_reader :user, :agendada

    def initialize(user, agendada)
      @user = user
      @agendada = agendada
    end

    def resolve
      scope
    end
  end

end
