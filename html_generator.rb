require 'JSON'
require 'open-uri'
require 'uri'


class ItemsController
#will require JSON and open-uri maybe 
	
	def initialize(args)
		@url = "http://lcboapi.com/products"
		@id = args[:id] || 0
		@term = args[:term] || ""
		@result = []
		@single = {}
	end

	def index
		@result.each do |product|
			puts product["name"]
	end
		
	end
	
	def show
		puts @single["name"]
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

	def retrieve_data()
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

a = ItemsController.new(term: "Pink Grapefruit")
a.retrieve_data
a.index