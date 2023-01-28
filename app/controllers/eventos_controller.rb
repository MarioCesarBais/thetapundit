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

  private

    def set_evento
        @evento = Evento.find(params[:id])
        authorize @evento
    end

end
