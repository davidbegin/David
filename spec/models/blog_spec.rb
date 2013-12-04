require 'spec_helper'

describe Blog do
	it "is valid with a title and body" do
		expect(Blog.new(title: 'Title', body: 'Body')).to be_valid
	end

	it "is invalid without a title" do
		expect(Blog.new(title: nil)).to have(1).errors_on(:title)
	end

	it "is invalid without a body" do 
		expect(Blog.new(body: nil)).to have(1).errors_on(:body)
	end
end

describe "Blogs Factory" do
	it "is valid" do
		expect(create(:blog)).to be_valid
	end
end