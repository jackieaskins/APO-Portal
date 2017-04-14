class CreateLineages < ActiveRecord::Migration[5.0]
  def change
    create_table :lineages do |t|
      t.string :name
      t.references :head, foreign_key: true

      t.timestamps
    end
  end
end
