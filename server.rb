require 'socket'

# TCPServer is a class representing a TCP Server.
# A TCP server accepts client connections over TCP and
# exchanges information with the client
server = TCPServer.new(2000) # Start a server that's bound to port 2000 of this machine

loop do
  puts "Server waiting for a new connection..."
  # `server.accept` causes our program to pause here for a client to connect.
  client_connection = server.accept
  # The program resumes as soon as a client connects

  # Send some logging information to the terminal to mention that we have a new connection
  puts "A client has connected!"

  #Let's wait for the client to send us something
  message_from_client = client_connection.gets

  #Now we can echo it back to let them know we got it
  client_connection.puts("We got your message! It was: #{message_from_client}")

  # Close the client connection
  client_connection.close

  puts "Closed connection"

  # Loop back to the top so we can go back to `accept` and wait for a new client
end
