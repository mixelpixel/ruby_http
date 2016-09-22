=begin
https://www.youtube.com/watch?v=uZGPZua6xgA
Ann Harter - "There is no Magic: Write your own HTTP server, and then stop"
A BASIC ECHO SERVER
=end


# The ECHO protocol: https://tools.ietf.org/html/rfc862
# An ECHO server:


require 'socket'

server = TCPServer.new 7

loop do
  Thread.start(server.accept) do |client|
    while true
      msg = client.gets
      client.puts msg
    end
  end
end


# an alt echo.rb: https://gist.github.com/kyanny/313649

#NOTE: How the heck do I log in/send text to this?

