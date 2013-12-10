
class EventsController < ApplicationController
def index 
	
	@events=Event.all
	
end
def new
	@user=User.find(current_user.id)
	@event=Event.new
end
def create
	@user=User.find(current_user.id)
	if @event=Event.create(event_params)
		redirect_to event_path(@event)
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
	
	@event=Event.find(params[:id])
	@comments=@event.comments(params[:id])
	@comment=Comment.new

end
def destroy
	
	@event=Event.find(params[:id])
	if @event.destroy
		redirect_to events_path
	end
end
def event_params
	params.require(:event).permit(:name,:description,:avatar,:loc)
end

end
