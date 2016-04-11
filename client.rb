require 'socket'

#TCPSocket is a class representing a connection to a TCP server.
#In the example below we will connect to the server on port 2000 of the machine '127.0.0.1'
# '127.0.0.1' is an address that _always_ points to your own machine,
# which is good since that's where our server will be running too.

server_connection = TCPSocket.new('127.0.0.1', 2000)

your_message = ARGV.join(" ")

#Send our message to the server
server_connection.puts(your_message)

#Get whatever the server sends back to us
response_from_server = server_connection.gets

#Print our the server's response to our screen
puts response_from_server

#Close the connection if we're done
server_connection.close
