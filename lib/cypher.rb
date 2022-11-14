require_relative 'generator'

class Cypher
  include Generator

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
      a: last_four_digits_array[0].to_i,
      b: last_four_digits_array[1].to_i,
      c: last_four_digits_array[2].to_i,
      d: last_four_digits_array[3].to_i
    }
  end

  def shifts(the_keys, the_offsets)
    {
      a: (the_keys[:a] + the_offsets[:a]),
      b: (the_keys[:b] + the_offsets[:b]),
      c: (the_keys[:c] + the_offsets[:c]),
      d: (the_keys[:d] + the_offsets[:d])
    }
  end

  def shifted_letter(letter, shift_hash, shift, reverse = false)
    # reverse arg being set to false by default allows me to use this helper 
    # method with both #encrypted_message and #decrypt_message
    if reverse
      number_of_shifts = -shift_hash[shift]
      # if reverse == true shift backwards through the shifts_hash
    else 
      number_of_shifts = shift_hash[shift]
    end 
    shifted_alphabet = alphabet.rotate(number_of_shifts)
    # The arg that is passed in depends on when condition from above is met
    index_position = alphabet.find_index(letter)
    # Built in ruby method to find the index position of the letter arg 
    # in the alphabet method from teh generator module
    shifted_alphabet[index_position]
    # The return is the NEW letter that is in the index position of the 
    # letter we are on in either the forward or backward shifted alphabet.
  end 
end