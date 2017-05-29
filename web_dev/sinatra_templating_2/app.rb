# Require Gems
require 'sinatra'
require 'sqlite3'


db = SQLite3::Database.new('students.db')
db.results_as_hash = true


get '/' do
  
  
end

