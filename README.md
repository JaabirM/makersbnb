![Makers Logo](/public/readmelogo.png)
# Hello, folks! <img src="https://raw.githubusercontent.com/MartinHeinz/MartinHeinz/master/wave.gif" width="30px">

### <div align="center">Project description:<br><br>
We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.</div>

-----------------------------------------------------

### <div align="center">Headline specifications:

Any signed-up user can list a new space.
Users can list multiple spaces.

Users should be able to name their space, provide a short description of the space, and a price per night.

Users should be able to offer a range of dates where their space is available.

Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.

Nights for which a space has already been booked should not be available for users to book that space.

Until a user has confirmed a booking request, that space can still be booked for that night.</div>

-----------------------------------------------------
  
### <div align="center">MVP:
By tuesday afternoon, our minimum viable product is to have a functioning web page that allows a user to create an account and view listed rooms. We aim to do this by creating a database that holds account detsails and room details. 
For example. The room details table could contain the room name, owned by who, booked by who and dates.</div>

-----------------------------------------------------


### <div align="center">User Stories</div>
<details>
  <summary> Click to exapand!</summary>
  
  
- [x] As a User 
So that I can use MakersBnB
I want to create an account.
  
- [x] As a Host
So I can rent out a room
Id like to list a space. 

- [x] As a Host 
Because I have multiple properties
Id like to list multiple spaces.

- [x] As a Host 
When I rent out a space
Id like to be able to add a name/description/price. 

- [x] As a Host
To not overbook 
Id like to show availability of my space. 

- [ ] As a Host
To prevent overbooking
Id like to make spaces unavailable once they've been booked.

- [x] As a Host 
For safety reasons
Id like only signed up users to hire my space.

- [x] As a signed up User
So that I can book 
Id like to request a space 

- [ ] As a host 
Until I have confirmed a request
Id like the room to remain bookable for that date.
  </details>
    
-----------------------------------------------------
### <div align="center">How to set up MakersBnB <div>
     
  Clone this Repo and then run: 
  ```
  $ bundle
  ```

  To set up the database: 
  ```
  $ psql
  ```
  
  followed by:
  ```
  $ CREATE DATABASE makersbnb;
  ```
  
  To set up the appropriate tables, connect to the database in psql and run the SQL scripts in the db/migrations folder in the given order.
  
