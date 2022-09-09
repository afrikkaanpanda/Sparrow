# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PATCH_posts_path", type: :request do
	let(:post) { create(:post) }
	it "redirects to root_path" do
      patch "/posts/#{post.id}", params: { post: {author: "alando", title: "test", description: "this is a test" } }
      expect(response).to have_http_status(302)
  end

  let(:post) { create(:post) }
  context "flash message" do
    it "to display correct flash message" do
      patch "/posts/#{post.id}", params: { post: {author: "alando", title: "test", description: "this is a test" } }
      expect(flash[:notice]).to eq ("Post was successfully updated.")
    end
  end

  let(:post) { create(:post) }
  context "when author is nil" do
    it "responds with unprocessable entity" do
      patch "/posts/#{post.id}", params: { post: {author: nil , title: "test", description: "this is a test" } }
      expect(response).to have_http_status(422)
    end
  end
end