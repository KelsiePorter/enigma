module Fileable
  def get_message(file_name)
    file = File.open(file_name, "r")
    message = file.read 
    file.close
    message.chomp
  end

  def write_message(file_name, message)
    file = File.open(file_name, "w")
    file.write(message)
    file.close
  end
end