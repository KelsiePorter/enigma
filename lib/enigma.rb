require_relative 'generator'
require_relative 'cypher'

class Enigma < Cypher 
  include Generator

  def encrypt(message, key = random_key, date = today)
    the_keys = split_keys(key)
    the_offsets = offsets(date)
    the_shifts = shifts(the_keys, the_offsets)
    {
      encryption: message,
      key: key,
      date: date
    }
  end

  def decrypt(encrypted_message, key, date = today)
    {
      decryption: encrypted_message,
      key: key,
      date: date
    }
  end
end