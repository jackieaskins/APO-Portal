class CreatePendingServiceProjectSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :pending_service_project_signups do |t|
      t.references :user, foreign_key: true
      t.references :service_project, foreign_key: true
      t.string :host_filter
      t.boolean :waitlist

      t.timestamps
    end
  end
end
