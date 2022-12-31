class UserPolicy < ApplicationPolicy
# User tratado pelo Devise; tratamento desta classe, somente quabdo administrador que ver prontuários
    attr_reader :user

    def initialize(user, record)
        @user = user
        @record = record
    end

    def escolher_cliente?
        @user.role == 'admin'
    end

    def criar_cliente?
        @user.role == 'admin'
    end

    def inserir_cliente?
        @user.role == 'admin'
    end

    def new? # chamado por new_prontuario
        @user.role == 'admin'
    end

    def edit? # chamado por edit_prontuario
        @user.role == 'admin'
    end
    
end