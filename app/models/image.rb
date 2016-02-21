class Image < ActiveRecord::Base

  belongs_to :inspection

  validates :name,
    presence: true
  validates :data,
    presence: true

end
