require "socket"

class NoteList
  def initialize
    @server = TCPServer.new(2345)
  end

  def create_notes
    while true
      socket = @server.accept
      note_list = []
      note = ""

      until note == "quit"
        socket.puts "Type your note. Type 'quit' to exit."
        note = socket.gets.chomp
        note_list << note

        if note == "quit"
          note_list.pop
          socket.puts "Your notes: #{note_list}"
        else
          socket.puts "You added: #{note}"
        end
      end
      socket.close
    end
  end
end

note_list = NoteList.new
note_list.create_notes
