module Generator 
  def today 
    Date.today.strftime("%m%d%y")
  end

  def random_key 
    (10000..99999).to_a.sample.to_s
  end
end