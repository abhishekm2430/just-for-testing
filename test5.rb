class Resume_builder
	def initialize()
		@resume = []
	end
	private
	def greet
		puts "hello"
	end
end

r = Resume_builder.new
r.send("greet")
