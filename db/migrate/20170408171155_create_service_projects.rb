class CreateServiceProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :service_projects do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.references :host, foreign_key: true
      t.string :project_type
      t.integer :max_volunteers

      t.timestamps
    end
  end
end
