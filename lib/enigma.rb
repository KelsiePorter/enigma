require_relative 'cypher'

class Enigma < Cypher 

  def encrypt(message, key = random_key, date = today)
    message = message.downcase
    keys = split_keys(key)
    offsets = offsets(date)
    shifts = shifts(keys, offsets)
    {
      encryption: encrypted_message(message, shifts),
      key: key,
      date: date
    }
  end

  def decrypt(encrypted_message, key, date = today)
    encrypted_message = encrypted_message.downcase
    keys = split_keys(key)
    offsets = offsets(date)
    shifts = shifts(keys, offsets)
    {
      decryption: decrypted_message(encrypted_message, shifts),
      key: key,
      date: date
    }
  end

  def encrypted_message(message, shifts)
    counter = 0
    output = ''
    message.chars.each do |letter|
      if !alphabet.include?(letter)
        output += letter
      elsif counter == 0
        output += shifted_letter(letter, shifts, :a)
        counter += 1
      elsif counter == 1
        output += shifted_letter(letter, shifts, :b)
        counter += 1
      elsif counter == 2
        output += shifted_letter(letter, shifts, :c)
        counter += 1
      elsif counter == 3
        output += shifted_letter(letter, shifts, :d)
        counter = 0 
      end
    end 
    output
  end

  def decrypted_message(message, shifts)
    counter = 0
    # Used a counter here to help progress the message through the
    # various a,b,c,d shifts and align with the index position in the
    # aplhabet. The counter is not called in first if statement
    # to account for unique character without affecting which shift
    # it is on.
    output = ''
    message.chars.each do |letter|
      if !alphabet.include?(letter)
        output += letter
      elsif counter == 0
        # Created a helper method in cypher to shift the letters
        # based on which letter I am iterating on and which shift I am
        # on (a:, :b, :c, or :d)
        output += shifted_letter(letter, shifts, :a, true)
        counter += 1
      elsif counter == 1
        output += shifted_letter(letter, shifts, :b, true)
        counter += 1
      elsif counter == 2
        output += shifted_letter(letter, shifts, :c, true)
        counter += 1
      elsif counter == 3
        output += shifted_letter(letter, shifts, :d, true)
        counter = 0
      end
    end 
    output
  end
end