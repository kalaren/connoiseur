require 'html_generator'
require 'open-uri'
require 'uri'

class Router

	def initialize(url)

		case url
		when 'index'
			term = ARGV[1]						# => Go to the index page
			puts "index"
		when 'show'
			id = ARGV[1] 
			puts id
			puts "show"
		end
		
	end

end

Router.new(ARGV[0])

# puts "first Arg"

# puts ARGV[0]

# puts "Second Arg"

# puts ARGV[1]