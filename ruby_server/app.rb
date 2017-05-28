# require gems
require 'sinatra'
# require 'sinatra-contrib'
require 'sqlite3'

db = SQLite3::Database.new('students.db')
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /

get '/' do
  name = params[:name]
  age = params[:age]
  string = "<h2>"
  
  if name
    string += "Hello #{name}"
  else
    string += "Hello you"
  end
  
  if age
    string += ", you are #{age} years old."
  else
    string += "!"
  end
  string += "</h2>"
  return string
end

get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}."
end

get '/students' do
  students = db.execute("select * from students")
  
  response = "<ul>"
  students.each do |student|
    response << "<li>#{student.name} - #{student.age} - #{student.campus}</li>"
  end
  response << "</ul>"
end

get '/student/:id' do
  student = db.execute("select * from students where id = ?", [id])
  student.to_s
end