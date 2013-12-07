require 'spec_helper'

describe "Nav" do
	before :each do
		visit root_path
	end

	describe "Github link" do 
		it "links to presidentJFK's github" do
			href = "https://github.com/presidentJFK"
			expect(page).to have_selector "a[href='#{href}']"
		end
	end

	describe "Email" do
		it "opens up an email" do
			href = "mailto:davidmichaelbe@gmail.com?subject=Hello David!"
			expect(page).to have_selector "a[href='#{href}']"
		end
	end

	describe "Portfolio" do
		it "links to portfolio page" do
			click_link 'Portfolio'
			expect(current_path).to eq portfolio_path
		end
	end

	describe "About" do
		it "links to about page" do
			click_link 'About' 
			expect(current_path).to eq about_path
		end
	end

	describe "Blog" do
		it "links to the blogs or home" do
			visit about_path
			click_link 'Blog'
			expect(current_path).to eq root_path
		end
	end
end
