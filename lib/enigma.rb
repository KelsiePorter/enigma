require_relative 'generator'

class Enigma 
  include Generator
  CHARACTER_SET = ("a".."z").to_a << " "

  def encrypt(message, key = random_key, date = today)
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