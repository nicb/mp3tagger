module Mp3tagger

  class NameParser
  
    attr_reader :filename
    attr_reader :artist, :album, :track, :title, :year, :subtitle
  
    def initialize(name)
      @filename = name
      parse
    end
  
  private
  
    def parse
      stripped_name = self.filename[0..-5] # removing the suffix
      (@track, @album, @artist, @title, @year, @subtitle, other) = stripped_name.split(/\s*-\s*/)
    end
  
  end

end
