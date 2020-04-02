RSpec.describe Mp3tagger::NameParser do

  it 'can be built' do
    expect(Mp3tagger::NameParser.new('test')).not_to be nil
  end

end
