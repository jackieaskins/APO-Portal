class CreateFellowships < ActiveRecord::Migration[5.0]
  def change
    create_table :fellowships do |t|
      t.references :semester, foreign_key: true
      t.string :name
      t.boolean :has_signup_form
      t.string :fellowship_type
      t.string :location
      t.string :description
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
