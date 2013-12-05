class Blog < ActiveRecord::Base
	validates_presence_of :title, :body
	has_attached_file :pic
end
