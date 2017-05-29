# require gem
require 'sinatra'
require 'sqlite3'
# erb = embedded ruby

# This properties ensures that the file is looked at
# Doesn't Work!
# set :public_folder, File.dirname(__File__) + '/static'

db = SQLite3::Database.new('students.db')
db.results_as_hash = true

get '/' do
  @students = db.execute("select * from students order by id")
   erb :home2
  # erb(:home2)
end

get '/students' do
  @students = db.execute("select * from students order by id")
  erb :home2
end

get '/students/new' do
  erb :new_student2
end

post '/students' do
  p params
  
  name = params[:name]
  age = params[:age].to_i
  campus = params[:campus]
  
  db.execute("insert into students (name, age, campus) values (?, ?, ?)", [name, age, campus])
  redirect '/'
end

get '/students/:id' do
  id = params[:id].to_i
  @students = db.execute("select * from students where id = ?", [id])
  erb :home2
end

get '/campuses' do
  @campuses = db.execute("select * from campuses")
  erb :campuses
end

get '/campuses/new' do
  erb :new_campus
end

post '/campuses' do
  p params
  
  abv = params[:abv]
  name = params[:name]
  
  db.execute("insert into campuses (abv, name) values (?, ?)", [abv, name])
  redirect '/campuses'
end

