module Mp3tagger

  class NameParser
  
    attr_reader :filename
    attr_reader :artist, :album, :track, :title, :year
  
    def initialize(name)
      @filename = name
      parse
    end
  
  private
  
    def parse
      (@artist, @album, @track, @title, @year, other) = self.filename.split(/\s*-\s*/)
    end
  
  end

end
