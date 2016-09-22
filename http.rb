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
=end

require 'socket'

def send_200(socket, content)
  socket.puts "HTTP/1.1 200 OK\n\n#{content}"
  socket.close
end

server = TCPServer.new 2016

loop do
  Thread.start(server.accept) do |client|

  request = client.gets
  # puts request
  if request.start_with?("GET")
      url = request.split(" ")[1]
      # puts "url: "+ url.to_s
      if url.start_with?("/images/")
        file = url.sub("/images/", "")
        # puts file
        pictures = File.read(file)
        # puts picture
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

