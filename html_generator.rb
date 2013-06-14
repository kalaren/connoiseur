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
			price = format_price(product["price_in_cents"])
			puts "<table>"
			puts "<tr>"
			puts "<td class='hide'>"
			puts "<img class='image' src='#{product['image_thumb_url']}' alt='Image Unavailable'>"
			puts "</td>"
			puts "<td class='show inner'>"
			puts "#{product['total_package_units']}&nbsp;#{product['name']}<br><br>Price:&nbsp;$#{price}<br>Type:&nbsp;#{product['primary_category']}<br>Producer:&nbsp;#{product['producer_name']}"
			puts "</td>"
			puts "</tr>"
			puts "</table>"
		end
		print_footer
	end
	
	def show
		print_header
		puts @single["name"]
		print_footer

#name, price_in_cents, primary_category 
#producer_name, image_thumb_url,



	end
	
	def print_header

		puts "<!DOCTYPE html>"

		puts "<html>"
		puts "<head>"
		puts "<link href='http://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>"
		puts "<link href='styles.css' rel='stylesheet' type='text/css'>"
		puts "<title> Drinks </title>"
		puts "</head>"

		puts "<body>"
		puts "<div id='container'>"
	end
	
	def print_footer
		puts "</div>"
		puts "</body>"
		puts "</html>"
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

	def format_price(cents_int)
		return cents_int.to_s.insert(-3, ".")
	end

end









# a = HtmlGenerator.new(term: "Pink Grapefruit")
# a.retrieve_data
# a.index