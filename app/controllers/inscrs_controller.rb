class InscrsController < ApplicationController
    before_action :authenticate_user!, :set_curso

    def new
        @inscr = Inscr.new(user_id: current_user.id, curso_id: @curso.id)
        @inscr.save!
        authorize @inscr
        redirect_to curso_path(@curso)
    end

    
    private

    def set_curso
        @curso = Curso.find(params.values.last) # focar o curso escolhido
    end
end
