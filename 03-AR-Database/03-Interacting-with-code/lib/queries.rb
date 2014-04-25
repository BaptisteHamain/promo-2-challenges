require 'sqlite3'

# opens the database
DATABASE_PATH = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(DATABASE_PATH)

def number_of_rows(db, table_name)
  db.execute( " SELECT COUNT(*) FROM #{table_name} " )
end

def sorted_artists(db)
  db.execute( "SELECT Name FROM Artist ORDER BY Name ")
end

def love_tracks(db)
  db.execute( "SELECT Name FROM Track WHERE Name LIKE '%love%' ")
end

def long_tracks(db, min_length)
  #TODO: return tracks verifying: duration > min_length (minutes)
  db.execute( "SELECT Name FROM Track WHERE Milliseconds > #{min_length}/360000 ")
end

puts long_tracks(db, 2)