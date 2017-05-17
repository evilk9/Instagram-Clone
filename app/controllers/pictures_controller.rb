class PicturesController < ApplicationController

	def index
		 

	end

	def show
		@picture = Picture.find(params[:id])
		
		
	end

	def edit
		
	end

	def update
	end

	def new
		@user = User.find(current_user.id)
		@picture = Picture.new
	end

	def create
		
		@picture = Picture.new(picture_params)
		@picture.user_id = current_user.id

		@picture.save

		redirect_to user_path(current_user.id) 

	end




	def picture_params 
		params.require(:picture).permit(:description, :image)
	end


end

