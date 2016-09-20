class Applications
	attr_accessor :controller
	attr_accessor :action
	attr_accessor :img
	attr_accessor :title
	attr_accessor :info

	def initialize(c,a,i,t, inf)
		self.controller = c
		self.action = a
		self.img = i
		self.title = t
		self.info = inf
	end

#	def initialize(file)
#
#	end

end
