class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :campus_address, :phone_number, :graduation_year, :graduation_semester, :school, :major, :birthday

  belongs_to :lineage, optional: true
  belongs_to :pledge_class
  has_many :hosted_service_projects, class_name: :service_project

  has_many :pending_service_project_signups
  has_many :pending_service_projects, through: :pending_service_project_signups, source: :service_project

  has_many :reported_service_project_signups
  has_many :reported_service_projects, through: :reported_service_project_signups, source: :service_project

  def preferred_full_name
    preferred_name && !preferred_name.empty? ? "#{preferred_name} #{last_name}" : "#{first_name} #{last_name}"
  end
end
