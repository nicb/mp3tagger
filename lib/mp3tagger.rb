require "mp3tagger/version"

module Mp3tagger
  class Error < StandardError; end
  RELATIVE_PATH = './mp3tagger'
end

%w(
  name_parser
).each { |f| require_relative File.join(Mp3tagger::RELATIVE_PATH, f) }
