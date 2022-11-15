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

    it 'can return the encryption hash' do 
      expected = enigma.encrypt("Hello World", "02715", "040895")

      expect(expected).to eq({
                              :date=>"040895", 
                              :encryption=>"keder ohulw", 
                              :key=>"02715"
                            })
    end

    it 'receives a message with unique characters and encrypts it' do
      expected = enigma.encrypt("Hello World", "02715", "040895")
      expected_2 = enigma.encrypt("HELLO WORLD", "02715", "040895")
      expected_3 = enigma.encrypt("!HeLLo& %WOrLD!", "02715", "040895") 

      expect(expected.keys.size).to eq(3)
      expect(expected.keys).to eq([:encryption, :key, :date])
      expect(expected[:encryption]).to eq("keder ohulw")
      expect(expected_2[:encryption]).to eq("keder ohulw")
      expect(expected_3[:encryption]).to eq("!keder& %ohulw!")
    end

    it 'the user can define the encryption key but not the date' do 
      allow(enigma).to receive(:today).and_return("121122")
      expected = enigma.encrypt("Hello World", "02715")
     
      expect(expected[:encryption]).to eq("rmjdyhugatb")
      expect(expected[:key]).to eq("02715")
      expect(expected[:date]).to eq("121122")
      expect(expected).to eq({
                              :date=>"121122", 
                              :encryption=>"rmjdyhugatb", 
                              :key=>"02715"
                            })
    end

    it 'the user does not have to define the encryption key or date' do 
      allow(enigma).to receive(:today).and_return("121122")
      allow(enigma).to receive(:random_key).and_return("40794")
      expected = enigma.encrypt("Hello World")
      key_array = expected[:key].chars.map { |num| num.to_i.to_s }

      expect(expected[:encryption].length).to eq(11)
      expect(expected[:key]).to be_an(String)
      expect(expected[:key].length).to eq(5)
      expect(key_array.join).to eq(expected[:key])
      expect(expected).to eq({
                              :date=>"121122", 
                              :encryption=>"btrbiobel j", 
                              :key=>"40794"
                            })
    end
  end

  describe '#decrypt' do 
    let(:enigma) { Enigma.new }

    it 'can return the decryption hash' do 
      expected = enigma.decrypt("keder ohulw", "02715", "040895")
      
      expect(expected).to eq({
                              :date=>"040895", 
                              :decryption=>"hello world", 
                              :key=>"02715"
                            })
    end

    it 'receives an encrypted message and decrypts it' do
      expected = enigma.decrypt("Keder oHulW", "02715", "040895")
      expected_2 = enigma.decrypt("%K!eder oHulW&", "02715", "040895")
      
      expect(expected.keys.size).to eq(3)
      expect(expected.keys).to eq([:decryption, :key, :date])
      expect(expected[:decryption]).to eq("hello world")
      expect(expected_2[:decryption]).to eq("%h!ello world&")
      expect(expected[:key]).to eq("02715")
      expect(expected[:date]).to eq("040895")
    end

    it 'the user can define the decryption key but not the date' do 
      allow(enigma).to receive(:today).and_return("121122")
      encrypted = enigma.encrypt("hello world", "02715")
      expected = enigma.decrypt(encrypted[:encryption], "02715") 

      expect(expected[:decryption]).to eq("hello world")
      expect(expected[:key]).to eq("02715")
      expect(expected[:date]).to eq("121122")

      encrypted_2 = enigma.encrypt("HELLO WORLD", "02715")
      expected_2 = enigma.decrypt(encrypted[:encryption], "02715") 

      expect(expected_2[:decryption]).to eq("hello world")
    end
  end
end