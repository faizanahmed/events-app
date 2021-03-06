class UsersController < ApplicationController
	def show
		@user=User.find(params[:id])
		
	end
	def edit
		@user=User.find(params[:id])
	end
	def update 
		@user=User.find(params[:id])
		EventMailer.welcome_email(@user).deliver
		if @user.update(user_params)
			redirect_to user_path(current_user)	
		else
			render 'show'
		end
	end
	def user_params
		params.require(:user).permit(:name,:bio)
	end
	
end
