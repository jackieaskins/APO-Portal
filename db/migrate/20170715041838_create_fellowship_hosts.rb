class CreateFellowshipHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :fellowship_hosts do |t|
      t.references :fellowship, foreign_key: true
      t.references :host, foreign_key: true

      t.timestamps
    end
  end
end
