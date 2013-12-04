require 'spec_helper'

describe "Signing in" do 
	context "when already a admin" do
		context "with the correct login info" do 
			it "adds the admin links" do
				Admin.create(email: 'sam@gmail.com', password: 'password', password_confirmation: 'password')
				visit new_admin_session_path
				fill_in :admin_email, with: 'sam@gmail.com'
				fill_in :admin_password, with: 'password'
				click_button 'Sign in'
				expect(page).to have_link 'New Blog'
			end
		end

		context "with the incorrect login info" do
			before :each do
				visit new_admin_session_path
				fill_in :admin_email, with: 'sam@gmail.com'
				fill_in :admin_password, with: 'password'
				click_button 'Sign in'
			end

			it "displays an error" do
				expect(page).to have_content 'Invalid'
			end

			it "renders the signin form again" do
				expect(current_path).to eq new_admin_session_path
			end
		end
	end
end

describe "Creating a new admin" do
	it "has no form for creating a new admin" do
		visit new_admin_registration_path
		expect(page).not_to have_content "Sign in"
	end
end

describe "Signing in with Wardens test helpers" do
	it "should sign the user in" do
		admin = create(:admin)
		login_as(admin, scope: :admin)
		visit root_path
		expect(page).to have_link "New Blog"
	end
end
