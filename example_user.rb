class User
	attr_accessor :name, :email

	def initialize( attirbutes = {})
		@name = attirbutes[:name]
		@mail = attirbutes[:email]
	end

	def formatted_email
		"#{@name} <#{@email}>"
	end
end
