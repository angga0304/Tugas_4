class Posting < ActiveRecord::Base
  has_attached_file :photo, :styles => {:medium => "600x300>", :thumb => "100x200>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/,
  :url => "/assets/postings/:id/:style/:basename.:extension",
  :path => "rails_root/public/assets/postings/:id/:style/:basename.:extension"
  validates_with AttachmentSizeValidator, :attributes => :photo, :less_than => 0.2.megabytes
end
