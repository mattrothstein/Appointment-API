class Appointment < ActiveRecord::Base
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def future?
    return false if self.start_time.nil? || self.end_time.nil?

    if self.start_time > DateTime.now && self.end_time > DateTime.now
      true
    else
      false
    end
  end


  def no_overlap?
    if (Appointment.where(start_time: self.start_time..self.end_time, end_time: self.start_time..self.end_time).count > 0)
      false
    else
      true
    end
  end


end
