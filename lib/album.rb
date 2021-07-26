class Album
  attr_reader :id, :name, :year, :genre, :artist
  attr_accessor :name, :year, :genre, :artist

  @@albums = {}
  @@total_rows = 0
  @@sold_albums = {}

  def initialize(name, year, genre, artist, id)
    @name = name
    @year = year
    @genre = genre
    @artist = artist
    @id = id || @@total_rows += 1
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.year, self.genre, self.artist, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update_name(name)
    @name = name
  end

  def update_year(year)
    @year = year
  end

  def update_genre(genre)
    @genre = genre
  end

  def update_artist(artist)
    @artist = artist
  end

  def songs
    Song.find_by_album(self.id)
  end

  def delete
      @@albums.delete(self.id)
  end

  def self.search(name)
    temp = @@albums.select { |k,v| v.name == name}
    temp.values[0]
  end
end


