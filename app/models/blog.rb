class Blog < ActiveRecord::Base
	validates_presence_of :title, :body
	has_attached_file :pic, {
		:styles => {:thumb =>["112x112#", :jpg]},
		:convert_options => {
			:medium => "-quality 80 -interlace Plane",
			:thumb => "-quality 80 -interlace Plane"
		}, :processors => [:thumbnail, :compression],
			:default_url => "missing.png"
	} 

	def time
		created_at.strftime("%b. %e, %Y")
	end
end
