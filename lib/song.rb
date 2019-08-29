class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.add_to_all(song_obj)
    @@all << song_obj    
    return song_obj
  end

  def Song.create
    song = Song.new
    add_to_all(song)
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    return song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    add_to_all(song)
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !find_by_name(name)
      return create_by_name(name)
    end
    return find_by_name(name)
  end

  def Song.alphabetical()
    arr = @@all.sort{ |a, b| a.name <=> b.name }
    return arr
  end

  def Song.new_from_filename(file_name)
    arr = file_name.split(/[\-\.]/).map do |ele|
      ele.strip
    end
    song = Song.new
    song.artist_name = arr[0]
    song.name = arr[1]
    return song
  end

  def Song.create_from_filename(file_name)
    Song.add_to_all(Song.new_from_filename(file_name))
  end

  def Song.destroy_all()
    @@all.clear
  end
end
