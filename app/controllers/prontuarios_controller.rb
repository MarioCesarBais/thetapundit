class ProntuariosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_prontuario, only: [:show, :edit, :destroy]
    
    def show
    end

    def new
        policy_scope(Prontuario)
        @paciente = User.find(params['paciente'].to_i)
        authorize @paciente
        @prontuarios = Prontuario.select { |p| p.user_id == @paciente.id }
    end

    def create
        policy_scope(Prontuario)
        # params.require(:prontuario).permit(:paciente_id, :anotacao)
        @anotacao = params['anotacao'] ?  params['anotacao'] : params['prontuario']['anotacao']
        user_id = (params['paciente_id'] ? params['paciente_id'] : params['prontuario']['paciente_id']).to_i
        @prontuario = Prontuario.new(data_hora: Time.now, user_id: user_id, anotacao: @anotacao)
        @prontuario.save ? flash.notice = 'Prontuário salvo com sucesso!' : flash.alert = 'Não foi gravada anotação no prontuário! Verificar!'
        authorize @prontuario
        redirect_to escolher_cliente_path
    end

    def edit
        authorize @prontuario
        @paciente = User.find(@prontuario.user_id)
        authorize @paciente
    end

    def update
        params.require(:prontuario).permit(:paciente_id, :prontuario_id, :anotacao)
        @prontuario = Prontuario.find(params['prontuario']['prontuario_id'])
        @prontuario.anotacao = params['prontuario']['anotacao']
        authorize @prontuario
        @prontuario.save ? flash.notice = 'Prontuário salvo com sucesso!' : flash.alert = 'Não foi gravada anotação no prontuário! Verificar!'
        redirect_to escolher_cliente_path
    end

    def destroy
        Prontuario.find(params['id']).destroy
        redirect_to escolher_cliente_path
    end
    
    def escolher_cliente
        authorize User, policy_class: UserPolicy
        @users = User.all
    end


    private

    def set_prontuario
        @prontuario = Prontuario.find(params[:id])
        authorize @prontuario
    end

end
