# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DELETE_posts_path", type: :request do
	let(:user) { create(:user) }
	let(:post) { create(:post) }
		it "redirects to root_path" do
			delete post_path( post)
			expect(response).to have_http_status(302)
		end
end