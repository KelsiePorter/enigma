require './lib/generator'

RSpec.describe Generator do 
  let(:mock_class) { Class.new { extend Generator }}

  it 'returns a date as a string' do 
    expect(mock_class.today).to be_a(String)
  end

  it 'returns a random key that is 5 characters long' do 
    expect(mock_class.random_key.length).to eq(5)
  end

  it 'returns and alphabet including a space' do 
    expect(mock_class.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    expect(mock_class.alphabet.length).to eq(27)
  end
end
