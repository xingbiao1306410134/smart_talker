class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  SEX = {0 => '女', 1 => '男'}

end
