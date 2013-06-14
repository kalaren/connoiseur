class ItemsController

	def initialize
		
		1.upto(10) do |i|
			@items << { id: i, name: "Item#{i}"}

		def index
			@items.each do |item|
				puts "id: #{item[:id]} - #{item[:name]}}"

		def show #going to show a specific item

		end

	end