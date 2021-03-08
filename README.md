
 # Brewery companies info - Sinatra Edition
   The application is about the companies information system  when a new user  want  an information they have to sign up first
    if  signup or log in  incorrectly, It redirect them back to the root page 
   If a user tries to signup with account information that already exists, there is  a flash message tells their file is in our the company list 
  the user will  know where to go 
   because i add up  navbar.
   the  logout button is somewhere inside, after they log in 
  if the users put wrong data it will show them an error message "It IS NOT IN OUR FILE"    
# How the app was build
Install the required Ruby Gems  such as sinatra gem  to gem file and install using the following command:
```ruby
bundle install
```
Build Controllers, Modeles, And Views They describe how the applications respond to HTTP requests .Call methods like get, post and patch using the following commands

``get '/' do
   erb :"/"
    end     
  ````
  
# How to Run the app
  It also has methods like headers, session,  and other things that relate to concepts from HTTP
 the application uses 'shotgun' to run a local server. Type the following in your terminal:
```ruby
shotgun
```
 Open up your  web browser and navigate to the following URL:
```ruby
http://localhost:9393
```

