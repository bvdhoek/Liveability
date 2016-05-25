class NeighbourhoodsController < ApplicationController
	def index
		# where().order().includes() makes a single query
		# The data won't get used until something asks for it (like an infinite list)
		# Select asks for specific data
		# includes the commune because we need it in the view
		@neighbourhoods = Neighbourhood.where(commune_id: params[:commune_id]).order(:name).includes(:commune).select(:id, :name, :commune_id)
	end

	def show
		# includes is called before find because it is a ActiveRecord method
		# and find returns a neighbourhood
		@neighbourhood = Neighbourhood.includes(:commune).find(params[:id])
		@commune = @neighbourhood.commune
	end
end
