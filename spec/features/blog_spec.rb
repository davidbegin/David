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
		it "redirects to the homepage" do
			visit new_blog_path
			expect(current_path).to eq new_admin_session_path
		end
	end
end
