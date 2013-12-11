class Event < ActiveRecord::Base
has_many :participants
mount_uploader :avatar,AvatarUploader
has_many :comments
end