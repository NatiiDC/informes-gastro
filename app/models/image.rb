class Image < ActiveRecord::Base

  mount_uploader :capture, CaptureUploader

  validates :name,
    presence: true

end
