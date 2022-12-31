class CreateProntuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :prontuarios do |t|
      t.datetime :data_hora
      t.bigint :user_id
      t.string :anotacao

      t.timestamps
    end
    add_foreign_key :prontuarios, :users
  end
end
