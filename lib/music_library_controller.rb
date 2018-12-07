require 'pry'

class MusicLibraryController
  extend Concerns::Findable

  def initialize(path = './db/mp3s')
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
    end
  end

  def list_songs
    sorted_by_name = Song.all.sort_by {|song| song.name}
    sorted = sorted_by_name.uniq
    sorted.each.with_index(1) do |song,index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_by_name = Artist.all.sort_by {|artist| artist.name}
    sorted_by_name.each.with_index(1) do |artist,index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    sorted_by_name = Genre.all.sort_by {|genre| genre.name}
    sorted_by_name.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
      # binding.pry

    Artist.find_by_name(input).songs.each.with_index(1) do |song, index|
        "#{index}. #{song.name} - #{song.genre.name}"
    end
  end
end
