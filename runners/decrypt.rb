require './lib/enigma'
require 'date'

enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read 
file.close

# Why wont this decrypt properly!?
decrypted_message = enigma.decrypt(message.chomp, ARGV[2], ARGV[3])
# require 'pry'; binding.pry
file = File.open(ARGV[1], "w")
file.write(decrypted_message[:decryption])
file.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"