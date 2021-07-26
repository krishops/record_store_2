require 'rspec'
require 'album'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album2 = Album.new("Blue", 1971, "Folk", "Joni Mitchell", nil) 
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", 1971, "Folk", "Joni Mitchell", nil) 
      album2 = Album.new("Blue", 1971, "Folk", "Joni Mitchell", nil) 
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album2 = Album.new("Blue", 1971, "Folk", "Joni Mitchell", nil) 
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album2 = Album.new("Blue", 1971, "Folk", "Joni Mitchell", nil) 
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update_name') do
    it("updates an album name by id") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album.update_name("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#update_year') do
    it("updates an album year by id") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album.update_year(1965)
      expect(album.year).to(eq(1965))
    end
  end

  describe('#update_genre') do
    it("updates an album genre by id") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album.update_genre("Free Jazz")
      expect(album.genre).to(eq("Free Jazz"))
    end
  end

  describe('#update_artist') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album.update_artist("J. Coltrane")
      expect(album.artist).to(eq("J. Coltrane"))
    end
  end

  describe('#songs') do
    it("returns an album's songs") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil)
      album.save()
      song = Song.new("Naima", album.id, nil)
      song.save()
      song2 = Song.new("Cousin Mary", album.id, nil)
      song2.save()
      expect(album.songs).to(eq([song, song2]))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album2 = Album.new("Blue", 1971, "Folk", "Joni Mitchell", nil) 
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('#search') do
    it("searches for an album by name") do
      album = Album.new("Giant Steps", 1960, "Jazz", "John Coltrane", nil) 
      album.save()
      album2 = Album.new("Blue", 1971, "Folk", "Joni Mitchell", nil) 
      album2.save()
      expect(Album.search(album.name)).to(eq(album))
    end
  end
end


    