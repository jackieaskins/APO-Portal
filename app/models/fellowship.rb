class Fellowship < ApplicationRecord
  validates_presence_of :name, :fellowship_type, :location, :description, :start_time, :end_time

  has_many :fellowship_hosts, inverse_of: :fellowship, dependent: :destroy
  has_many :hosts, through: :fellowship_hosts, source: :host

  has_many :pending_fellowship_signups, dependent: :destroy
  has_many :pending_attendees, through: :pending_fellowship_signups, source: :user

  has_many :reported_fellowship_signups, dependent: :destroy
  has_many :reported_attendees, through: :reported_fellowship_signups, source: :user

  accepts_nested_attributes_for :fellowship_hosts
end
