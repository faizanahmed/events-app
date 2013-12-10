class CommentsController < ApplicationController
	def new
		
		@event=Event.find(params[:event_id])
		@comment=Comment.new
	end
	def create
		@comment=Comment.new
		@event=Event.find(params[:event_id])

		

		@comment=@event.comments.build(comment_params)
		@comment.user_id=current_user.id

		if @comment.save
			redirect_to user_event_path(@event.user_id,@event)

		end	
	end
	def destroy
		@event=Event.find(params[:event_id])
		@comment=@event.comments.find(params[:id])
		if @comment.destroy
			redirect_to user_event_path(@event.user_id,@event)
		end
	end
	def comment_params
		params.require(:comment).permit(:content,:user_id,:event_id)
	end
end
