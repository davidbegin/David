require 'spec_helper'

describe "Creating a new blog" do
	context "when signed in" do
		before :each do
			admin = create(:admin)
			login_as(admin, scope: :admin)
		end

		context "with valid params" do
			before :each do
				visit new_blog_path
				fill_in :blog_title, with: 'First Blog'
				fill_in :blog_body, with: 'This is the start to something beautiful'
				click_button 'Create Blog'
			end

			it "creates a new blog and redirects to the new blog" do
				expect(page).to have_content "First Blog"
				expect(page).to have_content "This is the start to something beautiful"
			end

			it "displays a successful message" do
				expect(page).to have_content "First Blog successfully"
			end
		end

		context "with invalid params" do
			before :each do
				visit new_blog_path
				fill_in :blog_title, with: 'Bad Blog'
				click_button "Create Blog"
			end

			it "displays an error message" do
				expect(page).to have_content "can't be"
			end
		end
	end

	context "when not signed in" do
		it "redirects to the sign in page" do
			visit new_blog_path
			expect(current_path).to eq new_admin_session_path
		end
	end
end

describe "Editing a Blog" do
	before :each do 
		@blog = create(:blog)
	end

	context "when signed in" do 
		before :each do
			admin = create(:admin)
			login_as(admin, scope: :admin)
		end

		it "has a visible edit link" do
			visit blog_path(@blog)
			expect(page).to have_link 'Edit'
		end

		context "with valid params" do
			before :each do 
				visit edit_blog_path(@blog)
				fill_in :blog_title, with: 'Awesome Title'
				fill_in :blog_body, with: 'Check em'
				click_button 'Update Blog'
			end
			
			it "updates the blog" do 
				expect(page).to have_content 'Awesome Title'
				expect(page).to have_content 'Check em'
			end

			it "redirects to the newly updated blog" do
				expect(current_path).to eq blog_path(@blog)
			end
		end

		context "with invalid params" do
			before :each do
				visit edit_blog_path(@blog)
				fill_in :blog_title, with: nil
				click_button 'Update Blog'
			end

			it "renders the edit page" do
				expect(current_path).to eq edit_blog_path(@blog)
			end
		end
	end

	context "when not signed in" do
		it "does not have an edit link" do
			visit blog_path(@blog)
			expect(page).not_to have_link 'Edit'
		end

		it "redirects to to the sign in page" do
			visit edit_blog_path(@blog)
			expect(current_path).to eq new_admin_session_path
		end
	end
end

describe "Deleting a Blog" do
	before :each do
		@blog = create(:blog)
	end

	context "when signed in" do
		before :each do
			admin = create(:admin)
			login_as(admin, scope: :admin)
			visit blog_path(@blog)
			click_link 'Destroy'
		end

		it "destroys the blog" do
			expect(page).not_to have_content @blog.title
			expect(page).not_to have_content @blog.body
		end

		it "redirects you to the blogs index" do
			expect(current_path).to eq blogs_path
		end
	end

	context "when not signed in" do
		it "has no visible delete button" do
			visit blog_path(@blog)
			expect(page).not_to have_link 'Destroy'
		end
	end
end
