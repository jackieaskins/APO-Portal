class CreateReportedServiceProjectSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :reported_service_project_signups do |t|
      t.references :user, foreign_key: true
      t.references :service_project, foreign_key: true
      t.decimal :points

      t.timestamps
    end
  end
end
