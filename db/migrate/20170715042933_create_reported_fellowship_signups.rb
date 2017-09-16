class CreateReportedFellowshipSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :reported_fellowship_signups do |t|
      t.references :user, foreign_key: true
      t.references :fellowship, foreign_key: true
      t.decimal :points
      t.boolean :is_host

      t.timestamps
    end
  end
end
