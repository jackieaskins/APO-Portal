class ServiceProject < ApplicationRecord
  validates_presence_of :name, :start_time, :end_time, :location, :project_type, :max_volunteers

  belongs_to :host, class_name: 'User', optional: true

  has_many :pending_service_project_signups, dependent: :destroy
  has_many :pending_attendees, through: :pending_service_project_signups, source: :user

  after_update :update_waitlist, :update_host

  def add_attendee(user, host_filter)
    waitlist = pending_attendees.size >= max_volunteers
    pending_service_project_signups.create(user: user, host_filter: host_filter, waitlist: waitlist)
  end

  def update_waitlist
    sign_ups = pending_service_project_signups.order(:created_at)

    sign_ups.each_with_index do |sign_up, i|
      i < max_volunteers ? sign_up.update(waitlist: false) : sign_up.update(waitlist: true)
    end
  end

  def update_host
    sign_ups = pending_service_project_signups.where(waitlist: false).order(:created_at)

    yeses = []
    maybes = []

    sign_ups.each do |sign_up|
      yeses << sign_up if sign_up.host_filter == 'Yes'
      maybes << sign_up if sign_up.host_filter == 'Yes, if necessary'
    end

    new_host = nil
    new_host = compute_new_host(sign_ups, yeses, maybes) unless sign_ups.empty?
    update(host: new_host) unless host == new_host
  end

  def pending_waitlist_attendees
    pending_service_project_signups.order(:created_at).where(waitlist: true).map(&:user)
  end

  def pending_nonwaitlist_attendees
    pending_service_project_signups.order(:created_at).where(waitlist: false).map(&:user)
  end

  def project_length
    (end_time - start_time) / 1.hours
  end

  def start_end_time
    start_time_f = start_time.strftime('%m/%d/%y %I:%M %p')
    end_time_f = start_time.to_date == end_time.to_date ? end_time.strftime('%I:%M %p') : end_time.strftime('%m/%d/%y %I:%M %p')
    "#{start_time_f} - #{end_time_f}"
  end

  private

  def compute_new_host(sign_ups, yeses, maybes)
    if yeses.empty? && maybes.empty?
      sign_ups.first.user
    elsif yeses.empty?
      maybes.first.user
    else
      yeses.first.user
    end
  end
end
