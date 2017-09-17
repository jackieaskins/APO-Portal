class PledgeClass < ApplicationRecord
  belongs_to :semester
  has_many :users
end
