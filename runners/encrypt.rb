require './lib/enigma'
require 'date'

enigma = Enigma.new

file = File.open(ARGV[0], "r")
message = file.read 
file.close

encrypted_message = enigma.encrypt(message.chomp)

file = File.open(ARGV[1], "w")
file.write(encrypted_message[:encryption])
file.close

puts "Created '#{ARGV[1]}' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"  
