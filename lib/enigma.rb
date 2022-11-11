class Enigma 
  CHARACTER_SET = ("a".."z").to_a << " "

  def encrypt(message, key = key_generator, date = today)
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

  def key_generator 
    (10000..99999).to_a.sample.to_s
  end
end