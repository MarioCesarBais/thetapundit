class CreateCursos < ActiveRecord::Migration[6.0]
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :descricao
      t.date :inscr_inicio
      t.date :inscr_fim
      t.date :real_inicio
      t.date :real_fim

      t.timestamps
    end
  end
end
