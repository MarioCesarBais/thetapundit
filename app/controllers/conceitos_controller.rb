class ConceitosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_conceito, only: [:show, :edit, :update, :destroy]

  def index
    @conceitos = policy_scope(Conceito)
    authorize @conceitos
  end

  def show
  end

  def new
    @conceito = Conceito.new
    authorize @conceito
  end

  def create
    @conceito = Conceito.new(conceito_params)
    if @conceito.save
      authorize @conceito
      redirect_to conceito_path(@conceito), notice: "Conceito criado com sucesso!"
    else
      authorize @conceito
      render "new", alert: "Conceito não pôde ser salvo! Verificar!"
    end
  end

  def edit
    authorize @conceito
  end

  def update
    @conceito = Conceito.find(params[:id])
    @conceito.update(conceito_params)
    redirect_to conceito_path(@conceito)
  end

  def destroy
    authorize @conceito
    @conceito.destroy
    redirect_to conceitos_path
  end

  private

  def conceito_params
    params.require(:conceito).permit(:titulo, :descricao)
  end

  def set_conceito
    @conceito = Conceito.find(params[:id])
    authorize @conceito
  end
end
