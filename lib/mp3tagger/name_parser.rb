module Mp3tagger

  class NameParser

    attr_reader :filename
    attr_reader :artist, :album, :track, :title, :year, :subtitle
  
    def initialize(name)
      @filename = name
      parse
    end

    class ParseError < StandardError; end
  
  private
  
    DEFAULT_SUFFIX_LOW = '.mp3'
    DEFAULT_SUFFIX_HI  = '.MP3'
    SUFFIX_REGEXP = Regexp.compile(/\.[Mm][Pp]3\Z/)
    SPLIT_REGEXP = Regexp.compile(/\s*-\s*/)
    FIRST_PASS_REGEXP = Regexp.compile(/(\d)-(\d)/)
    CLEANUP_STRING = '\1@@\2'
    SECOND_PASS_REGEXP = Regexp.compile(/@@/)

    def parse
      stripped_name = strip_suffix(self.filename.chomp)
      cond_name = stripped_name.sub(FIRST_PASS_REGEXP, CLEANUP_STRING)
      (@track, @album, @artist, @title, dirty_year, @subtitle, other) = cond_name.split(SPLIT_REGEXP).map { |x| x unless (x =~ /\s*-\s*/) }.compact
      @year = dirty_year.sub(SECOND_PASS_REGEXP, '-') if dirty_year
      raise(ParseError, "Parse error: track is not set") unless @track && @track.to_i != 0
      [@track, @artist, @title].each { |key| raise(ParseError, "Parse error: #{key} is nil") unless key }
    end

    def strip_suffix(name)
      name.sub(SUFFIX_REGEXP, '')
    end
  
  end

end
