require 'yaml'
require 'byebug'

RSpec.describe Mp3tagger::NameParser do

  before do
    @correct_names = YAML.load(File.open(File.expand_path(File.join('..', 'fixtures', 'correct_names.yml'), __FILE__), 'r'))
    @wrong_names = YAML.load(File.open(File.expand_path(File.join('..', 'fixtures', 'wrong_names.yml'), __FILE__), 'r'))
  end

  it 'can be built' do
    expect(Mp3tagger::NameParser.new(@correct_names.to_a.first.first)).not_to be nil
  end

  it 'works with correct names' do
    @correct_names.keys.each do
      |key|
      expect((np = Mp3tagger::NameParser.new(key))).not_to be nil
      @correct_names[key].each do
        |k, v|
        meth = k.to_sym
        expect(np.send(meth)).to(eq(v), "Failing method: :#{k}, name: \"#{key}\": expected :\"#{np.send(meth)}\", got \"#{v}\"")
      end
    end
  end

  it 'fails gracefully with incorrect names' do
    @wrong_names.keys.each do
      |key|
      expect { Mp3tagger::NameParser.new(key) }.to raise_error(Mp3tagger::NameParser::ParseError)
    end
  end

end
