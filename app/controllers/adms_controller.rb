class AdmsController < ApplicationController
    before_action :authenticate_user!

    def criar_cliente # o administrador criando cliente; quando o cliente se auto-cria, utiliza devise
        render 'criar_cliente'
        @user = User.new
        authorize @user, policy_class: UserPolicy
    end
   
    def inserir_cliente
        flash.alert = ''
        @user = User.new
        if params[:fake_email] == '0'
            if (params[:email].strip.match(/\S*@\S*/)) then @user.email = params[:email].strip
            else flash.alert += 'Não foi fornecido e-mail no formato adequado, nem foi pedida geração aleatória! '
            end
        else @user.email = Faker::Internet.email
        end
        if params[:nome].blank?
            flash.alert += 'Nome não pode ser branco! '
        else @user.nome = params[:nome].strip
        end
        @user.telefone = params[:telefone].gsub(/\D/, '')
        unless @user.telefone.match(/\d{8}/)
            flash.alert += 'Número de telefone deve ter pelo menos 8 dígitos! '
        end
        @user.cpf = params[:cpf]
        if params[:gerar_senha_aleatoria] == '0'
            if params[:password].present?
                if params[:password] == params[:password_confirmação] then @user.password = params[:password]
                else flash.alert += 'Senha e confirmação divergem! '
                end
            else flash.alert += 'Senha em branco e não foi pedida geração de senha aleatória! '
            end
        else
            o = [('a'..'z'), ('A'..'Z'), ('0'..'9'), ('-.,!"@#$%&*()_+={[]}<>').split].map(&:to_a).flatten
            @user.password = (0...12).map { o[rand(o.length)] }.join
        end
        flash.alert = nil if flash.alert.empty?
        @user.role = 'cliente'
        @user.save
        authorize @user
    end

    def escolher_cliente
        authorize User, policy_class: UserPolicy
        @users = User.all
    end
end