# automatically gets included by the neighbourhood views
module NeighbourhoodHelper
	API_KEY = "AIzaSyDAZF2DOqJk9_qAqsg5FRjvfRyEeWxMVXQ"

	def float_to_description(variable)
		# guard for a blank variable
		return "deze informatie is niet beschikbaar" if variable.blank?

		# make the number easier to read
		number_to_human(variable.tr(',', '.').to_f)
	end

	def create_maps_iframe(query)
		"https://www.google.com/maps/embed/v1/search?key=" + API_KEY + "&q=" + query
	end
end
