class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    #Must find a way to make this beautiful
    #@@all.find(&:name.eql?(name))
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by(&:name)
  end

  def self.new_from_filename(info)
    artist, name = split_song_info(info)

    song = self.new_by_name(name)
    song.artist_name = artist

    song
  end

  def self.create_from_filename(info)
    artist, name = split_song_info(info)

    song = self.create_by_name(name)
    song.artist_name = artist

    song
  end

  def self.split_song_info(song_info)
    song_info.split(/ - |.mp3/)
  end

  def self.destroy_all
    @@all.clear
  end
end
