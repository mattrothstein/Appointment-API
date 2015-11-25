namespace :import_appointments do
  desc "imports appointments from a csv file"
  task :data => :environment do
    require 'csv'

    csv_file = File.join(Rails.root, 'app', 'appointments', 'appt_data.csv')
    csv_text = File.read(csv_file)
    # File.read returned a Malformed CSV error.
    # csv_text = File.read('app/appointments/appt_data.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      start_time = DateTime.strptime(row[0], "%m/%d/%y %H:%M")
      end_time = DateTime.strptime(row[1], "%m/%d/%y %H:%M")
      first_name = row[2]
      last_name = row[3]
      comments = row[4]
      Appointment.create!(start_time: start_time, end_time: end_time, first_name: first_name, last_name: last_name, comments: comments)
    end

  end
end
