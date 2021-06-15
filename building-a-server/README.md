Servers 1
=========

## Learn to

* Learn about something by playing with a toy version

## Introduction

This week we're thinking about networked applications. This means they involve clients and servers.

Today we're going to build a server.

## Exercise 1

Here's a simple server:

```ruby
require 'socket'

server = TCPServer.new(2345)

socket = server.accept

socket.puts "What do you say?"

they_said = socket.gets.chomp

socket.puts "You said: #{they_said}. Goodbye!"

socket.close
```

Stick that in a ruby file and **run** it. It won't do anything — it'll just sit there.

Open up **another** terminal and type this:

```bash
$ telnet localhost 2345
```

> You may need to run `brew install telnet` to install `telnet` first.

You should see something like:

```
Trying ::1...
Connected to localhost.
Escape character is '^]'.
What do you say?
```

Type something like this:

```
HELLO
```

Hit return. What do you see?

<img src="/screenshots/build-server-1.png" width = "60%">

## Exercise 2

Try the following challenges, in any order you like:

1. At the moment the server simply quits after the first user disconnects. Make so the server stays running so that the user can reconnect.
<img src="/screenshots/build-server-3.png" width = "60%">

2. Make it so the user can stay connected and typing stuff until they type 'quit'

<img src="/screenshots/build-server-2.png" width = "60%">

3. Create a separate `NoteList` class and make a notes app you can control over the network.

### Getting the IP address

On a mac, run:

```bash
$ ifconfig en0
```

You'll see something like this:

```
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	ether 3c:15:c2:e8:1b:f0
	inet6 fe80::1c68:ffdb:3ec8:7caf%en0 prefixlen 64 secured scopeid 0x4
	inet 192.168.48.104 netmask 0xfffffc00 broadcast 192.168.51.255
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect
	status: active
```

In this case the IP address of this computer is the thing after `inet` — `192.168.48.104`.
