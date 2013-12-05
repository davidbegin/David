class AddPicToBlogs < ActiveRecord::Migration
  def change
		add_attachment :blogs, :pic
  end
end
