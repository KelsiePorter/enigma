module Generator 
  def today 
    Date.today.strftime("%d%m%y")
  end

  def random_key 
    (10000..99999).to_a.sample.to_s
  end

  def alphabet 
    ("a".."z").to_a << " "
  end
end