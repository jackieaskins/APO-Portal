class CreateSemesters < ActiveRecord::Migration[5.0]
  def change
    create_table :semesters do |t|
      t.string :season
      t.integer :year
      t.boolean :current, default: false

      t.timestamps
    end
  end
end
