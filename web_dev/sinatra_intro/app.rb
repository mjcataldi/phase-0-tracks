# require gems
require 'sinatra'
require 'sqlite3'

# shotgun --host 0.0.0.0 --port 8080 app.rb

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID:\t#{student['id']}<br>"
    response << "Name:\t#{student['name']}<br>"
    response << "Age:\t#{student['age']}<br>"
    response << "Campus:\t#{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  return student.to_s
end

get '/contact/:address' do
  address = params[:address]
  "<p>Hello, your address is <em>#{address}</em></p>"
end

# Question 2
get '/great_job/:person_name' do
  person_name = params[:person_name]
  web_response = ""
  
  if person_name
    web_response = "<h3>Good job, #{person_name}!</h3>"
  else
    web_response = "Good job!"
  end
  return web_response
end

# Question 3
get '/add_numbers/:number_1/:number_2' do
  first_number = params[:number_1].to_i
  second_number = params[:number_2].to_i
  result = first_number + second_number
  
  html_result = "<h2>The result of adding <em>#{first_number}</em> to <em>#{second_number}</em> is <strong>#{result}</strong>.</h2>"
  return html_result
end

# Optional Bonus 4
get '/students/:first_name/:last_name' do
  first_name = ""
  last_name = ""
  where_clause = "where "
  
  if params[:first_name]
    first_name = params[:first_name]
    where_clause += "first_name = '#{first_name}' and "
  end  
  
  if params[:last_name]
    last_name = params[:last_name]
    where_clause += "last_name = '#{last_name}' and "
  end
  where_clause = where_clause[0..-6]
end


# RELEASE 1
# Question 1
# Sinatra is not the only web app library in Ruby.  There are many more that are released in a pre-packaged thing called "gems."  Gems can also be bundled in a file called Gemfile where this can be run once from the command line and all libraries will be automatically installed.  Pretty nifty ;-P.

# Question 2
# SQLite and sqlite3 are not the only options with using a database with Sinatra.  PostgreSQL is a common SQL associated with Ruby. Also Mongo which is a document oriented database.

# Question 3
# Web stack is a term that descirbes the software needed to run a website.  Usually this includes an operating system, a compiler program and a database management program.  For instance, using the term "LAMP" to describe Linus, Apache, MySql and PHP.