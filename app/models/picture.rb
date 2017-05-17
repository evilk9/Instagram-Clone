class Picture < ApplicationRecord
	belongs_to :user

	has_attached_file :image, styles: { medium: "300x300#", thumb: "100x100#", large:"500x500#", small:"200x200#" }
  	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end
