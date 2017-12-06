class FridgesController < ApplicationController

	def new
		@fridge = Fridge.new
	end

	def create
		Fridge.create(fridge_params)
		redirect_to fridge_path(@fridge)
	end

	def show
		@fridge = Fridge.find(params[:id])
	end

	private

	def fridge_params
		params.require(:fridge).permit(*args)
	end

end
