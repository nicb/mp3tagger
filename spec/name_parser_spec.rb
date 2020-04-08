require 'yaml'

RSpec.describe Mp3tagger::NameParser do

  before do
    @correct_names = YAML.load(File.open(File.expand_path(File.join('..', 'fixtures', 'correct_names.yml'), __FILE__), 'r'))
  end

  it 'can be built' do
    expect(Mp3tagger::NameParser.new('test')).not_to be nil
  end

  it 'works with correct names' do
    @correct_names.keys.each do
      |key|
      expect((np = Mp3tagger::NameParser.new(key))).not_to be nil
      @correct_names[key].each do
        |k, v|
        meth = k.to_sym
        expect(np.send(meth)).to eq(v)
      end
    end
  end

  it 'fails gracefully with incorrect names' do
  end

end
