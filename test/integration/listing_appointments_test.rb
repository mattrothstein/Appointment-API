require 'test_helper'
class ListingAppointmentsTest < ActionDispatch::IntegrationTest

  test 'returns list of all appointments' do
    get '/appointments'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns list of appointments by filter' do
    my_appt = Appointment.create!(start_time: '2013-11-29 16:05', end_time: '2013-11-29 16:15', first_name: 'matt', last_name: 'rothstein')
    her_appt = Appointment.create!(start_time: '2013-11-29 15:05', end_time: '2013-11-29 15:15', first_name: 'becca', last_name: 'rothstein')
    get '/appointments?start_time=2013-11-29 16:05'
    assert_equal 200, response.status
    appointments = JSON.parse(response.body, symbolize_names: true)
    same_start_appt = appointments.collect { |x| x[:start_time]}.first
    assert_includes same_start_appt, "2013-11-29T16:05"
    refute_includes same_start_appt, "2013-11-29T15:05"
  end

end
