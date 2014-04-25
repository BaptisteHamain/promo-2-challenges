require 'sqlite3'


DATABASE_PATH = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(DATABASE_PATH)

def number_of_rows(db, table_name)
  db.execute( " SELECT COUNT(*) FROM #{table_name} " ).first[0]
end

def sorted_artists(db)
  track = db.execute( "SELECT Name FROM Artist ORDER BY Name ").flatten
end

def love_tracks(db)
  db.execute( "SELECT Name FROM Track WHERE Name LIKE '%love%' ").flatten
end

def long_tracks(db, min_length)
  db.execute( "SELECT Name FROM Track WHERE Milliseconds > #{min_length}*60000 ").flatten
end

