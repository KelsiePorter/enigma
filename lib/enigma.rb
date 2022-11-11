require_relative 'cypher'

class Enigma < Cypher 

  def encrypt(message, key = random_key, date = today)
    message = message.downcase
    the_keys = split_keys(key)
    the_offsets = offsets(date)
    the_shifts = shifts(the_keys, the_offsets)
    encrypted_message = ''
    message.chars.each do |char|
      encrypted_message += shifted_alphabet[char]
    end 
    {
      encryption: encrypted_message,
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