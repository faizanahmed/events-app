class Event < ActiveRecord::Base
belongs_to :user
mount_uploader :avatar,AvatarUploader
has_many :comments
end