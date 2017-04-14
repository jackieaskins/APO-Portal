class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :preferred_name, :string
    add_reference :users, :pledge_class, foreign_key: true
    add_reference :users, :lineage, foreign_key: true
    add_column :users, :campus_address, :string
    add_column :users, :phone_number, :string
    add_column :users, :graduation_year, :integer
    add_column :users, :graduation_semester, :string
    add_column :users, :school, :string
    add_column :users, :major, :string
    add_column :users, :minor, :string
    add_column :users, :birthday, :date
  end
end
