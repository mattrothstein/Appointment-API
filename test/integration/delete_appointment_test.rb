class DeletingAppointmentTest < ActionDispatch::IntegrationTest
  setup {@appointment = Appointment.create!( start_time: '2013-11-29 15:05:00',
                                              end_time: '2013-11-29 15:15:00',
                                              first_name: 'matt',
                                              last_name: 'rothstein')}

  test 'delete apoointment' do
    delete "/appointments/#{@appointment.id}"
    assert_equal 204, response.status
  end


end
