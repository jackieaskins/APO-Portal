class PendingServiceProjectSignup < ApplicationRecord
  belongs_to :user
  belongs_to :service_project

  after_save :update_project_host
  after_destroy :update_waitlist

  private

  def update_waitlist
    service_project.update_waitlist
    update_project_host
  end

  def update_project_host
    service_project.update_host
  end
end
