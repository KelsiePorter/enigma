require_relative 'spec_helper'
require './lib/cypher'
require 'date'

RSpec.describe Cypher do 
  describe 'it determines the how much to shift the alphabet' do 
    let(:enigma) { Enigma.new }
    let(:today) { Date.today.strftime("%m%d%y") }

    it '#split_keys and turn to integers' do 
      expected = enigma.split_keys("12345")
      
      expect(expected).to eq({:a=>12, :b=>23, :c=>34, :d=>45})
    end

    it '#offsets' do 
      expected = enigma.offsets("040895")

      expect(expected).to eq({a: 1, b: 0, c: 2, d: 5})      
    end

    it '#shifts' do
      keys = enigma.split_keys("02715") 
      offsets = enigma.offsets("040895")
      expected = enigma.shifts(keys, offsets)

      expect(expected).to eq({:a=>3, :b=>27, :c=>73, :d=>20})
    end
  end
end
