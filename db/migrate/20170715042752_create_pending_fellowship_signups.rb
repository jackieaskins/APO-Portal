class CreatePendingFellowshipSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :pending_fellowship_signups do |t|
      t.references :user, foreign_key: true
      t.references :fellowship, foreign_key: true

      t.timestamps
    end
  end
end
