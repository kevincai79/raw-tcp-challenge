require 'socket'

#TCPSocket is a class representing a connection to a TCP server.
#In the example below we will connect to the server on port 2000 of the machine '127.0.0.1'
# '127.0.0.1' is an address that _always_ points to your own machine,
# which is good since that's where our server will be running too.

server_connection = TCPSocket.new('127.0.0.1', 2000)

# Read a line from the server
line_1 = server_connection.gets

# Read a second line from the server
line_2 = server_connection.gets

#Log out the first line we received from the server
puts "Line 1: #{line_1}"

#Log out the second line we received from the server
puts "Line 2: #{line_2}"

#Close the connection if we're done
server_connection.close
