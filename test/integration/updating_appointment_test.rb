class UpdatingAppointmentTest < ActionDispatch::IntegrationTest
  setup {@appointment = Appointment.create!( start_time: '2015-11-29 15:05:00',
                                              end_time: '2015-11-29 15:15:00',
                                              first_name: 'matt',
                                              last_name: 'rothstein')}

    test  'succesful update' do
      patch "/appointments/#{@appointment.id}",
        {appointment: {first_name: 'becca'} }.to_json,
         {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

         assert_equal 200, response.status
         assert_equal 'becca', @appointment.reload.first_name
    end

    test  'unsuccesful update' do
      patch "/appointments/#{@appointment.id}",
        {appointment: {first_name: nil} }.to_json,
         {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

         assert_equal 422, response.status
    end

end
