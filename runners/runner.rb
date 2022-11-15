require './lib/enigma'
require 'date'
require_relative 'fileable'

class Runner
  include Fileable 

  def initialize
    @enigma = Enigma.new
  end

  def encrypt(message_to_encrypt, encrypted_file)
    encrypted_message = @enigma.encrypt(get_message(message_to_encrypt))
    write_message(encrypted_file, encrypted_message[:encryption])
    output_message(encrypted_file, encrypted_message)    
  end
  
  def decrypt(encrypted_file, decrypted_file, key, date)
    decrypted_message = @enigma.decrypt(get_message(encrypted_file), key, date)
    write_message(decrypted_file, decrypted_message[:decryption])
    output_message(decrypted_file, decrypted_message)
  end

  private

  def output_message(file_name, message)
    puts "Created '#{file_name}' with the key #{message[:key]} and date #{message[:date]}"
  end
end