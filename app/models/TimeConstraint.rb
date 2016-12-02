class TimeConstraint
	def matches?(request)
		current = Time.now
		current.hour >=17 && current.hour <19
	end
end