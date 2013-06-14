require 'JSON'
require 'open-uri'


class ItemsController
#will require JSON and open-uri maybe 
	
	def initialize(args)
		@url = "http://lcboapi.com/products/"
		@id = args[:id] || 0
		@term = args[:term] || ""
		@result = []
		@single = {}
	end

	def index
	end
	
	def show

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
			non_parsed = open(@url+@id.to_s).read
			parsed = JSON.parse(non_parsed) 
			@single = parsed["result"]
		else
			non_parsed = open(@url).read
			parsed = JSON.parse(non_parsed)
			@result = parsed["result"]
			puts @result
		end
	end

	def format_price(cents_string)
	end

end

ItemsController.new(id: 0).retrieve_data()