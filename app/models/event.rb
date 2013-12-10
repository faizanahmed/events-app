class Event < ActiveRecord::Base

mount_uploader :avatar,AvatarUploader
has_many :comments
end