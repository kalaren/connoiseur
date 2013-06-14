require_relative 'html_generator'
require 'open-uri'
require 'uri'



class Router

	def initialize(type)
		gen = HtmlGenerator.new
		case type
		when 'index'
			gen.term = ARGV[1] if ARGV[1] != nil				
			gen.retrieve_data			
			gen.index

		when 'show'
			gen.id = ARGV[1] if ARGV[1] != nil
			gen.retrieve_data				
			gen.show
		end
		
	end

end

Router.new(ARGV[0])

# puts "first Arg"

# puts ARGV[0]

# puts "Second Arg"

# puts ARGV[1]