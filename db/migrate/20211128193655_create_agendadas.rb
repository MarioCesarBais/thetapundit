class CreateAgendadas < ActiveRecord::Migration[6.0]
  def change
    create_table :agendadas do |t|
      t.datetime :data_hora
      t.integer :user
      t.string :atend

      t.timestamps
    end
  end
end
