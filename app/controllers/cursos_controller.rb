class CursosController < ApplicationController

  skip_before_action :authenticate_user!, only: :index
  before_action :set_curso, only: [:show, :edit, :update, :destroy]

  def index
    @cursos = policy_scope(Curso)
    authorize @cursos
  end

  def show
  end

  def new
    @curso = Curso.new
    authorize @curso
  end

  def create
    @curso = Curso.new(curso_params)
    if @curso.save
      authorize @curso
      redirect_to curso_path(@curso), notice: "Curso criado com sucesso!"
    else
      authorize @curso
      render 'new', alert: 'Curso não pôde ser salvo! Verificar!'
    end
  end

  def edit
    authorize @curso
  end

  def update
    @curso = Curso.find(params[:id])
    @curso.update(curso_params)
    redirect_to curso_path(@curso)
  end

  def destroy
    authorize @curso
    @curso.destroy
    redirect_to cursos_path
  end
  

  private

  def curso_params
    params.require(:curso).permit(:nome, :descricao, :inscr_inicio, :inscr_fim, :real_inicio, :real_fim, :foto)
  end

  def set_curso
    @curso = Curso.find(params[:id])
    authorize @curso
  end

end
