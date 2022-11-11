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
  end

  describe '#decrypt' do 
    let(:enigma) { Enigma.new }
    let(:today) { Date.today.strftime("%m%d%y") }

    it 'receives an encrypted message and decrypts it' do 
      expected = enigma.decrypt("keder ohulw", "02715", "040895")

      expect(expected).to be_an(Hash)
      expect(expected.keys.size).to eq(3)
      expect(expected.keys).to eq([:decryption, :key, :date])
      # expect(expected[:decryption]).to eq("hello world")
      expect(expected[:key]).to eq("02715")
      expect(expected[:date]).to eq("040895")
    end

    it 'the user can define the decryption key but not the date' do 
      expected = enigma.decrypt("keder ohulw", "02715")

      # expect(expected[:decryption]).to eq("hello world")
      expect(expected[:key]).to eq("02715")
      expect(expected[:date]).to eq(today)
    end
  end
end