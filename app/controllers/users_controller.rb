class UsersController < ApplicationController


	def index
		if user_signed_in?

			@pictureArray = []

			@following = current_user.following

			@following.each do |user|
				user.pictures.each  do |picture|
					@pictureArray.push(picture)
				end
			end

			@pictureArray.sort! {|obj| obj.created_at}


		else
			redirect_to new_user_session_path
		end

	end

	def show
		@user = User.find(params[:id])
		@pictures = @user.pictures.all
		@pictures = @pictures.reverse


		#if on first view of profile user doesn't have picture then set there picture to a default image
		if !@user.image.exists?
			@user.image = File.open("public/images/defaultpicture.jpg")
			@user.save
		end
	end

	def edit
		if user_signed_in? 
			if current_user.id == User.find(params[:id]).id

				@user = User.find(params[:id])
			else
				redirect_to user_path
			end


		else
			redirect_to user_path
		end

	end

	def update
		@user = User.find(params[:id]) 
		if @user.update(user_params)
			redirect_to user_path 
		end

	end

	def following
		@userFollowing = User.find(params[:id]).following.all
	end

	def followers
		@userFollowers = User.find(params[:id]).followers.all
	end



	def user_params 
		params.require(:user).permit(:name, :description, :image)
	end


end
