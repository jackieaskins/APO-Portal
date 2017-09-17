class Semester < ApplicationRecord
  validates_presence_of :season, :year
  validates_uniqueness_of :season, scope: :year
  has_one :pledge_class
  has_many :service_projects
  has_many :fellowships

  def to_s
    "#{season} #{year}"
  end

  private

  def set_current
    Semester.where.not(id: id).update_all(current: false) if current
  end
end
