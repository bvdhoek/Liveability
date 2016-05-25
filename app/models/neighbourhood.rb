class Neighbourhood < ActiveRecord::Base
	belongs_to :commune

	def to_s
		# return the name if not blank or nil, else return the id to a string
		name.presence || id.to_s
	end
end
