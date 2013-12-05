class UsersController < ApplicationController
	def show
		@user=User.find(params[:id])
		#raise @user.to_yaml
	end
	def edit
		@user=User.find(params[:id])
	end
	def update 
		@user=User.find(params[:id])
		if @user.update(params[@user].permit[:name,:bio])
			redirect_to user_path(current_user)	
		else
			render 'show'
		end
	end
end
