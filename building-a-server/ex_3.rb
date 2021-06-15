# At the moment the server simply quits after the first user disconnects. Make so the server stays running so that the user can reconnect.

require "socket"
server = TCPServer.new(2345)

while true
  socket = server.accept
  socket.puts "What do you say?"

  they_said = socket.gets.chomp
  socket.puts "You said: #{they_said}. Goodbye!"
end
socket.close
