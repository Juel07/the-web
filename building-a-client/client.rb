require "socket"

socket = TCPSocket.new("localhost", 2345)

puts socket.gets
puts "wow what a rude server..I'm gonna say Mary"
socket.puts "Mary"
puts socket.gets

socket.close

# => Hello Client, what is your name?
# => wow what a rude server..I'm gonna say Mary
# => That's a lovely name, Mary
