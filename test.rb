class Blank
	def initialize(a)
		puts a
		puts ARGV[1].class
	end

end


Blank.new(ARGV[0])