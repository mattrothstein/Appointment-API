class CreateAppointmentsTest < ActionDispatch::IntegrationTest
  test 'create appointments' do
    post '/appointments',
  { appointment: { start_time: '2017-11-29 15:05:00',
                    end_time: '2017-11-29 15:15:00',
                    first_name: 'matt',
                    last_name: 'rothstein'}
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 201, response.status
  end

  test 'appointment must have start_time' do
    post '/appointments',
  { appointment: { start_time: nil,
                    end_time: '2015-11-29 15:05:00',
                    first_name: 'matt',
                    last_name: 'rothstein'}
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'appointment must have end_time' do
    post '/appointments',
  { appointment: { start_time: '2015-11-29 15:05:00',
                    end_time: nil,
                    first_name: 'matt',
                    last_name: 'rothstein'}
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'appointment must have first_name' do
    post '/appointments',
  { appointment: { start_time: '2015-11-29 15:05:00',
                    end_time: '2015-11-29 15:15:00',
                    first_name: nil,
                    last_name: 'rothstein'}
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'appointment must have last_name' do
    post '/appointments',
  { appointment: { start_time: '2015-11-29 15:05:00',
                    end_time: '2015-11-29 15:15:00',
                    first_name: 'matt',
                    last_name: nil}
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'appointment start_time must be in the future' do
    post '/appointments',
  { appointment: { start_time: '2013-11-29 15:05:00',
                    end_time: '2016-11-29 15:15:00',
                    first_name: 'matt',
                    last_name: 'rothstein'}
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'appointment end_time must be in the future' do
    post '/appointments',
  { appointment: { start_time: '2016-11-29 15:05:00',
                    end_time: '2013-11-29 15:15:00',
                    first_name: 'matt',
                    last_name: 'rothstein'}
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'appointment time must not overlap any other appointments' do
    post '/appointments',
  { appointment: { start_time: '2013-11-29 14:00:00',
                    end_time: '2016-11-29 14:05:00',
                    first_name: 'matt',
                    last_name: 'rothstein'}
    }.to_json,
    {'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s}

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end

end
