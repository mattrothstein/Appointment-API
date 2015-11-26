
This API was made to CREATE, READ, UPDATE and DELETE Appointments in our database. All appointments must have valid first and last names. You cannot create new appointments
with start and end times that overlap existing appointments. All appointments must be scheduled in the future.

How to use the API:

Please use the following format for start and end times.   
<tt>yyyy-mm-dd%20h:m</tt> use <tt>%20</tt> for any white space in your query string.  

* LIST  
* All Appointments    
  GET https://hidden-cliffs-4643.herokuapp.com/appointments         
* Appointments by Start Time  
  Will return all appointments 3 hours before and 3 hours after the specified start time.   
  GET https://hidden-cliffs-4643.herokuapp.com/appointments?start_time=    
  example: <tt>https://hidden-cliffs-4643.herokuapp.com/appointments?start_time=2013-11-01%2007:00</tt>    
* Appointments by End Time  
  Will return all appointments 3 hours before and 3 hours after the specified start time.       
  GET https://hidden-cliffs-4643.herokuapp.com/appointments?end_time=   
  example: <tt>https://hidden-cliffs-4643.herokuapp.com/appointments?start_time=2013-11-01%2009:00</tt>     
* Appointments by First Name    
  GET https://hidden-cliffs-4643.herokuapp.com/appointments?first_name=     
  example: <tt>https://hidden-cliffs-4643.herokuapp.com/appointments?first_name=laurence</tt>       
* Appointments by Last Name     
  GET https://hidden-cliffs-4643.herokuapp.com/appointments?last_name=      
  example: <tt>https://hidden-cliffs-4643.herokuapp.com/appointments?first_name=marcum</tt>     

* CREATE  
  POST https://hidden-cliffs-4643.herokuapp.com/appointments       
  <tt>-d '{ "appointment":{"first_name": "Matt", "last_name": "Rothstein", "start_time":"2015-12-01 10:00", "end_time": "2015-12-01 10:05", "comments" : "optional"}}'</tt>

* UPDATE  
  PATCH https://hidden-cliffs-4643.herokuapp.com/appointments/:id   
  <tt>-d '{ "appointment":{"start_time":"2015-12-01 09:55"}}'</tt>

* DELETE  
  DELETE https://hidden-cliffs-4643.herokuapp.com/appointments/:id   
