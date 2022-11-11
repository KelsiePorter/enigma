require_relative 'cypher'

class Enigma < Cypher 

  def encrypt(message, key = random_key, date = today)
    message = message.downcase
    the_keys = split_keys(key)
    the_offsets = offsets(date)
    the_shifts = shifts(the_keys, the_offsets)
    {
      encryption: encrypted_message(message, the_shifts),
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

  def encrypted_message(message, the_shifts)
    counter = 0
    output = ''
    message.chars.each do |letter|
      if counter == 0
        shifted_alphabet = alphabet.rotate(the_shifts[:a])
        index_position = alphabet.find_index(letter)
        output += shifted_alphabet[index_position]
        counter += 1
      elsif counter == 1
        shifted_alphabet = alphabet.rotate(the_shifts[:b])
        index_position = alphabet.find_index(letter)
        output += shifted_alphabet[index_position]
        counter += 1
      elsif counter == 2
        shifted_alphabet = alphabet.rotate(the_shifts[:c])
        index_position = alphabet.find_index(letter)
        output += shifted_alphabet[index_position]
        counter += 1
      elsif counter == 3
        shifted_alphabet = alphabet.rotate(the_shifts[:d])
        index_position = alphabet.find_index(letter)
        output += shifted_alphabet[index_position]
        counter = 0 
      end
    end 
    output
  end
end