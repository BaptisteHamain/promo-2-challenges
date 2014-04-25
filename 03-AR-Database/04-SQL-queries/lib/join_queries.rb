require 'sqlite3'

DATABASE_PATH = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(DATABASE_PATH)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute( " SELECT Artist.Name, Track.Name,  Album.Title
    FROM Artist
    INNER JOIN Album, Track
    ON Album.AlbumId = Track.TrackId
    AND Album.ArtistId = Artist.ArtistId " )

end

def stats_on(db, category)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  db.execute( " SELECT g.name, COUNT(t.TrackId), AVG(t.Milliseconds)
                FROM Track t INNER JOIN Genre g
                ON g.GenreId = t.GenreId
                WHERE g.name = '#{category}'
    " )
end

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists
  db.execute( " SELECT artist.name, COUNT(track.Name)
                FROM track
                INNER JOIN album, artist, genre
                ON track.albumId = album.albumId
                AND album.ArtistId = artist.ArtistId
                AND genre.GenreId = track.GenreId
                WHERE genre.name = 'Rock'
                GROUP BY artist.name
                ORDER BY COUNT(track.TrackId) DESC
                LIMIT 5
    " )
end

#puts detailed_tracks(db)
#puts stats_on(db, 'Rock')
puts top_five_rock_artists(db)
