class Enigma 
  CHARACTER_SET = ("a".."z").to_a << " "

  def encrypt(message, key = "", date = "")
    {
      encryption: message.upcase,
      key: key,
      date: date
    }
  end
end