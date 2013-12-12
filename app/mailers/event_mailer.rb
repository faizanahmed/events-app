class EventMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  def request_email(user,event)
   @user = user
   @event=event
    @url  = event_path(@event)
    mail(to: @user.email, subject: 'You have a  pending request')
    end	
end
