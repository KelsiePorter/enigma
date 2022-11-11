require_relative 'spec_helper'
require 'date'
require './lib/enigma'

RSpec.describe Enigma do 
  it 'exists' do 
    enigma = Enigma.new

    expect(enigma).to be_an(Enigma)
  end
  
  describe '#encrypt' do 
    let(:enigma) { Enigma.new }
    let(:today) { Date.today.strftime("%m%d%y") }

    it 'receives a message and encrypts it' do
      expected = enigma.encrypt("Hello World", "02715", "040895")

      expect(expected).to be_an(Hash)
      expect(expected.keys.size).to eq(3)
      expect(expected.keys).to eq([:encryption, :key, :date])
      # expect(expected[:encryption]).to eq("keder ohulw")
      expect(expected[:key]).to eq("02715")
      expect(expected[:date]).to eq("040895")
    end

    it 'the user can define the encryption key but not the date' do 
      expected = enigma.encrypt("Hello World", "02715")

      # expect(expected[:encryption]).to eq("keder ohulw")
      expect(expected[:key]).to eq("02715")
      expect(expected[:date]).to eq(today)
      # add expectation for when the user tries to provide a date but not a key
      # incorrect number of characters will help tell if the user is trying to pass a date
      # and not a key
    end

    it 'the user does not have to define the encryption key or date' do 
      expected = enigma.encrypt("Hello World")
      key_array = expected[:key].chars.map { |num| num.to_i.to_s }

      # expect(expected[:encryption]).to eq("keder ohulw")
      expect(expected[:key]).to be_an(String)
      expect(expected[:key].length).to eq(5)
      expect(key_array.join).to eq(expected[:key])
      expect(expected[:date]).to eq(today)
    end

    it 'returns error if user does not provide a message' do 
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