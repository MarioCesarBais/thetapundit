class EventosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_evento, only: [:show, :edit, :destroy]

  def index
    @eventos = policy_scope(Evento)
    authorize @eventos
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = Evento.where(inicio: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def show
  end

  def new
    @evento = Evento.new
    authorize @evento
  end

  def create
    @evento = Evento.new(evento_params)
    if @evento.save
      authorize @evento
      redirect_to evento_path(@evento), notice: "evento criado com sucesso!"
    else
      authorize @evento
      render 'new', alert: 'evento não pôde ser salvo! Verificar!'
    end
  end


  private

    def set_evento
        @evento = Evento.find(params[:id])
        authorize @evento
    end

    def evento_params
      params.require(:evento).permit(:titulo, :descricao, :inicio, :fim, :hora_inicio, :hora_fim, :foto)
    end

end
