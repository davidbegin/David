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
end
