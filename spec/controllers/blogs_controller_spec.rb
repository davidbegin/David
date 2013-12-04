require 'spec_helper'

describe BlogsController do
	before :each do
		controller_sign_in
	end

	describe "#new" do
		it "assigns a new blog" do
			get :new
			expect(assigns(:blog)).to be_an_instance_of(Blog)
		end
	end

	describe "#create" do
		context "with valid params" do
			it "creates a new blog" do
				expect{
					post :create, blog: attributes_for(:blog)	
				}.to change(Blog, :count).by(1)
			end

			it "redirects to the new blog" do
				post :create, blog: attributes_for(:blog)
				expect(response).to redirect_to Blog.last
			end
		end

		context "with invalid params" do
			it "does not create a new blog" do
				expect{
					post :create, blog: { title: 'Nice Title' }	
				}.to change(Blog, :count).by(0)
			end

			it "renders the new template" do
				post :create, blog: { body: 'Look at all this content!' }
				expect(response).to render_template :new
			end
		end
	end

	describe "#edit" do 
		it "finds and assigns the correct blog" do
			@blog = create(:blog)
			get :edit, id: @blog.id
			expect(assigns(:blog)).to eq @blog
		end
	end

	describe "#update" do 
		before :each do
			@blog = create(:blog)
		end

		context "with valid params" do
			before :each do
				patch :update, id: @blog.id, blog: { title: 'Woah', body: 'Nice' }
			end

			it "updates the blog" do
				@blog.reload
				expect(@blog.title).to eq 'Woah'
				expect(@blog.body).to eq 'Nice'
			end

			it "redirects to the newly updated blog" do
				expect(response).to redirect_to @blog
			end
		end

		context "without valid params" do
			xit "renders the edit page again" do
				patch :update, id: @blog.id, blog: { title: nil }
				expect(response).to eq redirect_to edit_blog_path(@blog)
			end
		end
	end
end



