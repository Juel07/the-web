require "socket"

server = TCPServer.new(2345)

socket = server.accept

socket.puts "Hello Client, what is your name?"
name = socket.gets.chomp
socket.puts "That's a lovely name, #{name}"

socket.close
