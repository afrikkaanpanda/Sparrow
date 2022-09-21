# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DELETE_posts_path", type: :request do
	let(:post) { create(:post) }
	it "redirects to root_path" do
	  delete post_path(post)
		expect(response).to have_http_status(302)
	end

	let(:post) { create(:post) }
	context "flash message" do
		it "to display correct flash message" do
			delete post_path(post)
			expect(flash[:notice]).to eq("Post was successfully deleted.")
		end
	end
end