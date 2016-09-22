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

# NOTE: How the heck do I log in/send text to this?
# per: http://answers.microsoft.com/en-us/windows/forum/windows_7-windows_programs/telnet-is-missing-in-windows-features-in-windows-7/aba760a4-7957-4705-ac91-b34f1592d51d
# Windows: StartMenu, Control Panel, Programs and Features, Turn Windows Features on or off:
# select the Telnet Client check box
# OKAY: now just enter "telnet localhost 7"

# some neat info: http://www.windowsnetworking.com/articles-tutorials/windows-7/Windows-7-Simple-TCPIP-Services-What-How.html

# how do I terminate telnet?
# per: http://superuser.com/questions/486496/how-do-i-exit-telnet
# "ctrl + ]" to get to the telnet coonsole, then type "quit"

# some more neat info: https://technet.microsoft.com/en-us/library/c.aspx

