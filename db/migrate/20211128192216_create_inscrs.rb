class CreateInscrs < ActiveRecord::Migration[6.0]
  def change
    create_table :inscrs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :curso, null: false, foreign_key: true

      t.timestamps
    end
  end
end
