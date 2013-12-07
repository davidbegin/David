require 'spec_helper'

describe "Nav" do
	before :each do
		visit root_path
	end

	describe "github link" do 
		it "links to presidentJFK's github" do
			href = "https://github.com/presidentJFK"
			expect(page).to have_selector "a[href='#{href}']"
		end
	end

	describe "email" do
		it "opens up an email" do
			href = "mailto:davidmichaelbe@gmail.com?subject=Hello David!"
			expect(page).to have_selector "a[href='#{href}']"
		end
	end

	describe "portfolio" do
		it "links to portfolio page" do
			click_link 'Portfolio'
			expect(current_path).to eq portfolio_path
		end
	end
end
