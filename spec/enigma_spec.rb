require_relative 'spec_helper'
require './lib/enigma'

RSpec.describe Enigma do 
  it 'exists' do 
    enigma = Enigma.new

    expect(enigma).to be_an(Enigma)
  end
end