class AddAttachmentPhotoToPostings < ActiveRecord::Migration
  def self.up
    change_table :postings do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :postings, :photo
  end
end
