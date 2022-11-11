class Cypher
  
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
end