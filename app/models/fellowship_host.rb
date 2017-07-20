class FellowshipHost < ApplicationRecord
  validates :host, uniqueness: { scope: :fellowship }
  belongs_to :fellowship
  belongs_to :host, class_name: 'User'
  after_create :create_pending_fellowship_signup

  def create_pending_fellowship_signup
    fellowship.pending_fellowship_signups.create(user: host)
  end
end
