class ReportedServiceProjectSignup < ApplicationRecord
  belongs_to :user
  belongs_to :service_project
end
