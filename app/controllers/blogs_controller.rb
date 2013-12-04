class BlogsController < ApplicationController
	before_filter :authenticate_admin!, only: [:new, :create]

	def show
		@blog = Blog.find(params[:id])
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)

		if @blog.save
			redirect_to @blog
			flash[:notice] = "#{@blog.title} successfully created"
		else
			render :new
			# msg = @blog.errors.full_messages.collect.join(' ')
			# flash[:error] = "#{msg}"
			flash[:error] = "Error"
		end
	end

	private
		def blog_params
			params.require(:blog).permit(:title, :body)
		end
end
