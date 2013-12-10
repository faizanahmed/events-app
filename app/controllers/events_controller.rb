
class EventsController < ApplicationController
def index 
	
	@events=Event.all
end
def new
	@user=User.find(params[:user_id])
	@event=@user.events.new
end
def create
	@user=User.find(params[:user_id])
	if @event=@user.events.create(event_params)
		redirect_to user_event_path(params[:user_id],@event)
	else 
		render 'new'
	end
end
def edit
	@user=User.find(params[:user_id])
	@event=@user.events.find(params[:id])
end
def update

	@user=User.find(params[:user_id])
	@event=@user.events.find(params[:id])
	@event.update(event_params)
	redirect_to user_event_path(params[:user_id],@event)
end
	

def show
	# @event=Event.find(params[:id])
	@user=User.find(params[:user_id])
	@event=@user.events.find(params[:id])
	@comments=@event.comments(params[:id])
	@comment=Comment.new

end
def destroy
	@user=User.find(params[:user_id])
	@event=@user.events.find(params[:id])
	if @event.destroy
		redirect_to user_events_path
	end
end
def event_params
	params.require(:event).permit(:name,:description,:avatar,:loc)
end

end
