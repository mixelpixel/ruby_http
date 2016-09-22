=begin
https://www.youtube.com/watch?v=uZGPZua6xgA
Ann Harter - "There is no Magic: Write your own HTTP server, and then stop"
A BASIC ECHO SERVER
=end


# The ECHO protocol: https://tools.ietf.org/html/rfc862
# An ECHO server:


require 'socket'

# server = TCPServer.new 7    # <-- This works fine on win7
server = TCPServer.new 1024   # <-- I guess on Ubuntu I don't have root permission?

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
# or whatever host number you're using, i.e. "telnet localhost #"

# some neat info: http://www.windowsnetworking.com/articles-tutorials/windows-7/Windows-7-Simple-TCPIP-Services-What-How.html

# how do I terminate telnet?
# per: http://superuser.com/questions/486496/how-do-i-exit-telnet
# "ctrl + ]" to get to the telnet console, then type "quit"

# some more neat info: https://technet.microsoft.com/en-us/library/c.aspx

# "If you are running Linux Kernel 2.6.24 or above and have libcap installed,
# you can allow program to bind to ports under 1014 as non-root user. See more at:
# http://stackoverflow.com/questions/413807/is-there-a-way-for-non-root-processes-to-bind-to-privileged-ports-1024-on-l/414258#414258
# uname -a or uname -r to find out the linux kernel

 
