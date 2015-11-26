== README

This API was made to CREATE, READ, UPDATE and DELETE Appointments in our database. All appointments must have valid first and last names. You cannot create new appointments
with start and end times that overlap existing appointments. All appointments must be scheduled in the future.

How to use the API:

Please use the following format for start and end times.  return
<tt>mm/dd/yy h:m</tt>

* LIST
All Appointments = GET https://hidden-cliffs-4643.herokuapp.com/appointments  return  
Appointments by Start Time = GET https://hidden-cliffs-4643.herokuapp.com/appointments?start_time= return
Appointments by End Time = GET https://hidden-cliffs-4643.herokuapp.com/appointments?end_time=  return
Appointments by First Name = GET https://hidden-cliffs-4643.herokuapp.com/appointments?first_name= return
Appointments by Last Name = GET https://hidden-cliffs-4643.herokuapp.com/appointments?last_name=  return

* CREATE
POST https://hidden-cliffs-4643.herokuapp.com/appointments  return
<tt>-d '{ "appointment":{"first_name": "Matt", "last_name": "Rothstein", "start_time":"12/01/15 10:00", "end_time": "12/01/15 10:05", "comments" : "optional"}}'</tt>

* UPDATE
PATCH https://hidden-cliffs-4643.herokuapp.com/appointments/:id  return
<tt>-d '{ "appointment":{"start_time":"12/01/15 09:55"}}'</tt>

* DELETE
DELETE https://hidden-cliffs-4643.herokuapp.com/appointments/:id  return
