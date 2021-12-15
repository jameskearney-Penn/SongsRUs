class CreateTegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :tegistrations do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
