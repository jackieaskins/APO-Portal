class Lineage < ApplicationRecord
  belongs_to :head, class_name: 'User', optional: true
  has_many :users
end
