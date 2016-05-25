class CommunesController < ApplicationController
	def index
		# The view only needs name and id but @communes is expected by most people
		# and it doesn't affect the performence a lot
		@communes = Commune.all.order(:name)
	end
end
