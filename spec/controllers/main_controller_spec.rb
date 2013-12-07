require 'spec_helper' 

describe MainController do
	describe "#portfolio" do
		it "responds with a 200 status" do
			get :portfolio
			expect(response.status).to eq 200
		end
	end
end
