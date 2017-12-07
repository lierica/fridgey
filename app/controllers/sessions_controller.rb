class SessionsController < ApplicationController

	def new

	end

	def create
		@fridge = Fridge.find_by(name: params[:name])
		if @fridge
			session[:fridge_id] = @fridge.id
			redirect_to fridge_path(@fridge)
		else
			redirect_to '/signup'
		end
	end

	def destroy
		session.destroy
		redirect_to '/login'
	end

end
