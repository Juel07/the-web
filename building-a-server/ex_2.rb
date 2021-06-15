# Make it so the user can stay connected and typing stuff until they type 'quit'

require "socket"

server = TCPServer.new(2345)

socket = server.accept

socket.puts "What do you say?"

they_said = socket.gets.chomp
until they_said == "quit"
  socket.puts "You said: #{they_said}. Goodbye!"
  they_said = socket.gets.chomp
end
socket.close
