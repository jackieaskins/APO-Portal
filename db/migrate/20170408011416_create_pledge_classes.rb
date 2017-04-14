class CreatePledgeClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :pledge_classes do |t|
      t.string :name
      t.string :semester

      t.timestamps
    end
  end
end
