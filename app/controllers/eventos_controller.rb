class EventosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_evento, only: [:show, :edit, :destroy]

  def index
    @eventos = policy_scope(Evento)
    authorize @eventos
  end

  def show
  end

  private

    def set_evento
        @evento = Evento.find(params[:id])
        authorize @evento
    end

end
