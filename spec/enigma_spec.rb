require_relative 'spec_helper'
require './lib/enigma'

RSpec.describe Enigma do 
  it 'exists' do 
    enigma = Enigma.new

    expect(enigma).to be_an(Enigma)
  end
  
  describe '#encrypt' do 
    it 'receives a message and encrypts it' do 
      enigma = Enigma.new
      expected = enigma.encrypt("Hello World", "02715", "040895")

      expect(expected).to be_an(Hash)
      expect(expected.keys.size).to eq(3)
      expect(expected.keys).to eq([:encryption, :key, :date])
    end

    xit 'the user can define the encryption key' do 
      # add expectation for when the user tries to provide a date but not a key
      # incorrect number of characters will help tell if the user is trying to pass a date
      # and not a key
    end

    xit 'the user can define the encryption key and the date' do 
    end

  end

  describe '#decrypt' do 
    xit 'receives an encrypted message and decrypts it' do 
      # expect that it returns a hash (xyz.class).to eq(Hash)
      # expect that the hash has three keys xyz.keys.size.to eq(3)
      # expect that the hash has three keys xyz.keys.to eq([:decryption, :key, :date])
    end
  end
end