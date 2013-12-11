
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
	@event=Event.create(event_params)
	@participant=Participant.new
	@participant.event_id=@event.id
	@participant.user_id=current_user.id
	@participant.status="Confirmed"
	if  @participant.save
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
	@participants=Participant.where("event_id=?",params[:id])

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

def search
	
	if params[:search]==""
		@events=Event.where("loc like ?","#{params[:search_loc]}%")
	
	else
		@events=Event.where("name like ?","#{params[:search]}%")
		
	end
	if params[:search]=="" && params[:search_loc]==""
		@events={}
	end

end
end
