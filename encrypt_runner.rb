# This is where we will pass in the message that we want
# to be encrypted.
# Need to write logic to take the result of the encryption
# and write it to another .txt
file = File.open(ARGV[0], 'r')
message = file.read 
# result =  Enigma.new.encrypt(message)
result = message.upcase
file.close 

new_file = File.open(ARGV[1], 'w')
new_file.write(result)
new_file.close