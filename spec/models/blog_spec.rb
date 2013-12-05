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

	it "can have a pic" do
		blog = Blog.new(title: 'Title', body: 'Body', pic: File.new("#{Rails.root}/app/assets/images/kufa_gate.jpg"))
		expect(blog).to be_valid
	end

	describe "time" do
		it "returns the time created formatted" do
			time = Time.parse("18/12/2013")
			blog = Blog.create(title: 'Poker Face', body: "Ma ma ma mah", created_at: time)
			expect(blog.time).to eq "Dec. 18, 2013"
		end
	end
end

describe "Blogs Factory" do
	it "is valid" do
		expect(create(:blog)).to be_valid
	end
end
