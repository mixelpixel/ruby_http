

=begin
https://www.youtube.com/watch?v=uZGPZua6xgA
Ann Harter - "There is no Magic: Write your own HTTP server, and then stop"
A VERY BASIC, INSECURE HTTP SERVER
=end 

# The HTTP protocol: https://www.ietf.org/rfc/rfc2616.txt

# BASIC HTTP COMMANDS:
# GET    :  "gets" a requested file
# POST   :  "posts" new information
# PUT    :  "puts" updated information, e.g. often in a database
# DELETE :  "deletes" data (a piece of information or a file!)

# HTTP STATUS CODES:
# 1xx : Informative
# 2xx : Successful (most often you'll see '200OK')
# 3xx : Redirection
# 4xx : Client Error (e.g. '404 File Not Found'
# 5xx : Server Error (...this never happens)
# HTTP code cats: https://http.cat/

# A very basic HTTP server:

=begin
I can't get the jpeg file to actually display :(
http://stackoverflow.com/questions/39636545/basic-ruby-http-how-to-send-jpg-to-localhost
HA - I had a variable mismatch: pictures and picture... (line 62 & 64)
ALSO: NOW with the mismatched variable fixed,
the script runs fine in Ubuntu
(& per Aleksey, works in Mac)
but win7 doesn't load the lolcat.
Per Holger:
   "Your response is not valid HTTP/1.1.
   Line endings must be \r\n not just \n.
   Also, you are completely disregarding content encoding.
   The binary content of a JPG will probably not be valid as part of a UTF-8 string."
        – Holger Just
=end

require 'socket'

def send_200(socket, content)
  socket.puts "HTTP/1.1 200 OK\r\n\r\n#{content}"  # <- per Holger
  socket.close
end

server = TCPServer.new 2016  # <-- something above 1024

loop do
  Thread.start(server.accept) do |client|
  request = client.gets

  if request.start_with?("GET")
      url = request.split(" ")[1]

      if url.start_with?("/images/")
        file = url.sub("/images/", "")
        picture = File.binread(file)               # <-- per Holger
        send_200(client, picture)
      else
        send_200(client, "hello!")
      end
    end
  end
end


# NOTE: this is a very insecure server.
# for a better static file server and http proxy server,
# try: https://www.nginx.com/
# http://nginx.org/en/docs/beginners_guide.html
# OT: http://stackoverflow.com/questions/10182798/why-are-ports-below-1024-privileged

# interesting:
# https://www.practicingruby.com/articles/implementing-an-http-file-server
# http://codereview.stackexchange.com/questions/83522/ruby-webserver-app
# https://ruby-doc.org/core-2.1.1/Encoding.html
# http://ruby-doc.org/stdlib-2.0.0/libdoc/socket/rdoc/Socket.html
# https://matteomelani.wordpress.com/2011/11/11/a-simple-web-server-is-ruby/
