require_relative 'generator'

class Enigma 
  include Generator

  def encrypt(message, key = random_key, date = today)
    the_keys = split_keys(key)
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

  def split_keys(key)
    {
      a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i
    }
  end

  def offsets
  end

  def shifts
  end

end