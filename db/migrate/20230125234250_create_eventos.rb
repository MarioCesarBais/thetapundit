class CreateEventos < ActiveRecord::Migration[7.0]
  def change
    create_table :eventos do |t|
      t.string :titulo
      t.string :descricao
      t.date :inicio
      t.date :fim
      t.time :hora_inicio
      t.time :hora_fim
      t.string :foto

      t.timestamps
    end
  end
end
