require 'socket'

class IRC
	def initialize(server,port,nick)
		@server=server
		@port=port
		@nick=nick
	end

	def send(msg)
		@irc.puts "#{msg}\n"
	end

	def connect()
		@irc = TCPSocket.open(@server, @port)
		send "USER #{@nick} 0 * :Zaratan"
		send "NICK #{@nick}"
	end

	def get_msg()
		return @irc.gets
	end


end

module Action

attr_reader :irc

	def initialize(irc)
		@irc=irc
	end

	def join_channel(chan)
		@irc.send("JOIN #{chan}")
	end

	def talk(dest,msg)
		@irc.send("PRIVMSG #{dest} :#{msg}")
	end

	def ping(dest)
		@irc.send "PONG #{dest}"
	end

	def version(dest)
		@irc.send "NOTICE #{dest} :Zar a Bottes v0.1"
	end

end

