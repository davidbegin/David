require 'spec_helper'

describe "Admin Factory" do
	it "is valid" do
		expect(create(:admin)).to be_valid
	end
end
