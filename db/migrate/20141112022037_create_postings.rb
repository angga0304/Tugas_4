class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.integer :userid

      t.timestamps
    end
  end
end
