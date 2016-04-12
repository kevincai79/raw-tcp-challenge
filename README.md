# TCP: Humble Beginnings

## Learning Competencies

 * Understand what a TCP server is at a basic level
 * Understand what a TCP client is at a basic level
 * Understand how TCP servers and clients talk to each other

## Release 0

Start `server.rb` running, it will start an infinite loop that waits for new connections.

```
$ ruby server.rb
Server waiting for a new connection...
```

Run `client.rb` in another terminal window, it's set up to talk to the server program. Watch them in action. Hopefully you see something like this when `client.rb` runs.

```
$ ruby client.rb hello world
We got your message! It was: hello world
```

Check out the other terminal window. There should be a message there indicating that a client had connected.

```
$ ruby server.rb
Server waiting for a new connection...
A client has connected!
Closed connection
Server waiting for a new connection...
```

How did this all work? Read through the code with your pair and discuss, can you figure out how these things are working together?

## Release 1

In the code you've reviewed, both `server_connection.accept` and `TCPSocket.new` return new `TCPSocket` objects. `TCPSocket`s represent a communication link between two programs. This link can be present between two programs on the same computer _or_ different computers. In other words, this is our first step into networking.

`TCPSocket#gets` is a method that waits around for some data to be sent down the link. It will wait (pausing the program) until data arrives. Check out `server.rb` — see where the server is using `#gets` to wait for data from the client?

`TCPSocket#puts` is a method that _sends_ data down the link to the other side. It will try to send data down the link, and will wait (pausing the program) until the other side signals that it's ready to receive data with `#gets`. Notice that `client.rb` uses `#puts` to send the contents of `ARGV` to the server process.

Programs can use `TCPSocket#gets` and `TCPSocket#puts` to communicate. One side signals that it's ready to receive data and the other side sends data down the link. Programs can trade giving and receiving back and forth to create bi-directional communication.

Now that we've learned a little bit about how programs communicate with TCP, update the server to send a message containing the current time (check `DateTime#strftime`) _before_ it receives a message from the client. You'll need to change the client too, to receive the new message from the server.

Now, when you run the client against the server you might have it print out something like this:

```
$ ruby client.rb hey there
Timestamp from the server:
04/11/2016 02:25:28

Response from the server:
We got your message! It was: hey there
```

## Release 2

We've got the basics down, so let's write a cheering mascot server and client. Create files for `cheering_server.rb` and `cheering_client.rb`.

The **server** should wait to accept a cheer from a client, and send back the following responses based on what message it receives.

| Message from Client | Response       |
| :-----------------: | :------------: |
| RED HOT             | H-O-T!         |
| DO IT AGAIN         | Go, Fight, Win |
| 2 BITS              | Holler!        |
| STOMP YOUR FEET     | STOMP!         |

You can make up your own responses if you would like, but make sure you support at least this default set.

The **client** should send a cheer name down the link to the server and print out the response it gets back. For example:

```
$ ruby client.rb RED HOT
Response from server: "H-O-T!"

$ ruby client.rb 2 BITS
Response from server: "Holler!"
```

Believe it or not, you've actually created a _protocol_. A protocol is just an agreement about what format data is sent and received in. Here, our protocol is defined in the table of messages and responses.

Since the other pairs in your cohort are also building servers fitting this protocol, your client should be able to talk to _their_ servers just as easily as it talks to your own.

## Release 3

The most exciting part of a network protocol like TCP is that it allows two programs to communicate across different machines on a network.

Find another group and connect to their server instead of your own. This means you're going to need to connect to their IP address, not `127.0.0.1`.

To find the IP address of a machine run the following in the terminal:

```bash
ifconfig en0 inet
```

You'll get back something like

```
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
 inet 192.168.0.101 netmask 0xffffff00 broadcast 192.168.0.255
```

In the example above, `192.168.0.101` is this machine's IP address.

Modify `client.rb` to connect to another pair's machine and talk to their server. They should do the same with you. Does it work? Can you send a cheer name and get a response back?

Congratulations, you're half way to inventing the web!
