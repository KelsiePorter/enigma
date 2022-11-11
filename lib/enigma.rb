class Enigma 
  CHARACTER_SET = ("a".."z").to_a << " "

  def encrypt(message, key = "", date = today)
    {
      encryption: message,
      key: key,
      date: date
    }
  end

  private

  def today 
    Date.today.strftime("%m%d%y")
  end
end