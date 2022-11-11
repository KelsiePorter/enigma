require_relative 'generator'

class Enigma 
  include Generator

  def encrypt(message, key = random_key, date = today)
    the_keys = split_keys(key)
    the_offsets = offsets(date)
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

  def offsets(date)
    integer_date = date.to_i
    squared_date = integer_date * integer_date
    last_four_characters = squared_date.to_s[-4..-1]
    last_four_digits_array = last_four_characters.chars
    {
      a_offset: last_four_digits_array[0].to_i,
      b_offset: last_four_digits_array[1].to_i,
      c_offset: last_four_digits_array[2].to_i,
      d_offset: last_four_digits_array[3].to_i
    }
  end

  def shifts
  end

end