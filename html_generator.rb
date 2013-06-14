require 'JSON'
require 'open-uri'
require 'uri'


class HtmlGenerator

	attr_accessor :id, :term

#will require JSON and open-uri maybe 
	
	def initialize()
		@url = "http://lcboapi.com/products"
		@id = 0
		@term = ""
		@result = []
		@single = {}
	end

	def index 
		print_header
		@result.each do |product|
			puts product["name"]
		end
		print_footer
	end
	
	def show
		print_header
		puts @single["name"]
		print_footer
	end
	
	def print_header

		puts '<!DOCTYPE html>'

		puts '<html>'
		puts '<head>'
		puts '<LINK href="styles.css" rel="stylesheet" type="text/css">'
		puts '<title> Drinks </title>'
		puts '</head>'

		puts '<body>'
	end
	
	def print_footer
		puts '</body>'
		puts '</html>'
	end

	def retrieve_data
		if @id != 0
			non_parsed = open(@url + "/" + @id.to_s).read
			parsed = JSON.parse(non_parsed) 
			@single = parsed["result"]
		elsif @term != ""
			uri = URI.encode(@term)
			non_parsed = open(@url + "?per_page=100" + "&q=" + uri).read
			parsed = JSON.parse(non_parsed)
			@result = parsed["result"]
		else
			non_parsed = open(@url + "?per_page=100").read
			parsed = JSON.parse(non_parsed)
			@result = parsed["result"]
		end
	end

	def format_price(cents_string)
	end

end

# a = HtmlGenerator.new(term: "Pink Grapefruit")
# a.retrieve_data
# a.index