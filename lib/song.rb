
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = Song.new()
    song.save
    song
  end

  def Song.new_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = Song.new_by_name(name)
    song
  end

  def Song.find_by_name(song)
    Song.all.find { |s| s.name == song }
  end

  def Song.find_or_create_by_name(song)
    Song.find_by_name(song) ? Song.find_by_name(song) : Song.create_by_name(song)
  end

  def Song.alphabetical
    self.all.sort_by { |s| s.name }
  end

  def Song.new_from_filename(song_file)
    song = Song.new_by_name(song_file.split(' - ')[1].split('.mp3')[0])
    song.artist_name = song_file.split(' - ')[0]
    song
  end

  def Song.create_from_filename(song_file)
    song = Song.new_by_name(song_file.split(' - ')[1].split('.mp3')[0])
    song.artist_name = song_file.split(' - ')[0]
    song
  end

  def Song.destroy_all
    self.all.clear
  end

end
