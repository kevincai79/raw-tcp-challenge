# TCP: Humble Beginnings

## Learning Competencies

 * Understand what a TCP server is at a basic level
 * Understand what a TCP client is at a basic level
 * Understand how TCP servers and clients talk to each other

**Note:** The point of this challenge is to learn about TCP and networking. Keep the competencies in mind and box your time accordingly, no need to build The World's Greatest TCP Server Ever.

## Release 0

Read the code in `client.rb` and `server.rb` carefully and understand what's happening. If you're not sure, ask questions!

Start `server.rb` running, then run `client.rb` to connect to it in another terminal window. Watch them in action. Hopefully you see something like this when `client.rb` runs.

```
$ client.rb
Greetings from Matt and Casey's TCP server
Time is now 2015-07-26 18:36:55 -0500
```

Right now the server sends two lines of data to the client. **Add a third.**

Make sure you update `client.rb` to receive and display the new line you've added!

## Release 1

Now let's make the client send data to the server as well.

You can use both the `#gets` _and_ `#puts` on a TCP connection object. `#gets` retrieves data from the other side of the connection, and `#puts` sends data.

Change your client to accept a command line argument and send it to the server. The server should take that, capitalize it, and send it back along with the other content it sends.

e.x.
```
$ client.rb grasshoppers
Greetings from Matt and Casey's TCP server
Time is now 2015-07-26 18:36:55 -0500
Echo: GRASSHOPPERS

$ client.rb hello
Greetings from Matt and Casey's TCP server
Time is now 2015-07-26 18:37:00 -0500
Echo: HELLO
```

Ask questions if you're confused or stuck!

## Release 2

Let's expand the server.

The server should send back the following responses based on what message it receives from the client.

| Message from Client | Response       |
| :-----------------: | :------------: |
| RED HOT             | H-O-T!         |
| DO IT AGAIN         | Go, Fight, Win |
| 2 BITS              | Holler!        |
| STOMP YOUR FEET     | STOMP!         |

You can make up your own responses if you would like, but _keep the messages the same._

Your client will be in one terminal window:

```
$ ruby client.rb RED HOT
Response from server: "H-O-T!"

$ ruby client.rb 2 BITS
Response from server: "Holler!"
```

Your server will be in a second terminal window, hopefully with some nice logging to see what's going on.

```
$ ruby server.rb
Client connected
Received "RED HOT"

Client connected
Received "2 BITS"
```

Believe it or not, you've actually created a _protocol_. A protocol is just an agreement about what format data is sent and received in. Here, our protocol is defined in the table of messages and responses.

Since the other pairs in the cohort are also building servers fitting this protocol, your client should be able to talk to _their_ servers just as easily as it talks to your own.

## Release 3

The most exciting part of a network protocol like TCP is that it allows two programs to communicate across a network.

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

Modify `client.rb` to connect to another pair's machine and talk to their server. They should do the same with you.

Congratulations, you're half way to inventing the web!
