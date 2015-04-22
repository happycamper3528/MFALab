# Objective 2

require 'json'
puts "Email?"
email = gets.chomp

f = File.new('./JSON_data', 'r')
json_data = f.read
f.close

ruby_data = JSON.parse(json_data)

record = ruby_data[email]

# if record does not exist then end the program

# if record does exist then check their password

if record == nil
  puts "Email not found"
else
  puts "Password?"
  password = gets.chomp
  require 'digest/md5'
  hashed_password = Digest::MD5.hexdigest(password)
  if record["Password"] == hashed_password
    array_record = record.to_a
    rand_q = array_record.shift(1)
    question = rand_q.sample[0]

    puts "What is your " + question + "?"
    answer = gets.chomp

    if answer == record[question]
      puts "Login Successful!"
    else
      puts "Invalid Answer"
      exit
    end
  else
    puts "Incorrect Password"
    exit
  end
end
# Finished