class Appointment < ActiveRecord::Base
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validate  :start_time_in_future, :end_time_in_future, :end_time_greater_than_start_time,
            :start_time_overlap, :end_time_overlap, :on => :create


private

  def start_time_in_future
    if self.start_time < DateTime.now
      errors.add(:start_time, "start time must be in future")
    end
  end

  def end_time_in_future
    if self.end_time < DateTime.now
      errors.add(:end_time, "end time must be in future")
    end
  end

  def end_time_greater_than_start_time
    if self.start_time > self.end_time
      errors.add(:end_time, "end time must be after start time")
    end
  end

  def start_time_overlap
    if (Appointment.where(start_time: self.start_time..self.end_time).count > 0)
      errors.add(:start_time, "start time overlaps with existing appointment")
    end
  end

  def end_time_overlap
    if (Appointment.where(end_time: self.start_time..self.end_time).count > 0)
      errors.add(:end_time, "end time overlaps with existing appointment")
    end
  end

end
