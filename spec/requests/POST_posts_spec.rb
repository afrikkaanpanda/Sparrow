# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST_posts_path", type: :request do
    it "redirects to root_page" do
      post posts_path, params: {post: {author: "alando", title: "test", description: "this is a test"}}
      expect(response).to have_http_status(302)
  end

  context "when title is nil" do
    it "respond with unprocessable entity" do
      post posts_path, params: {post: {author: "alando", title: nil, description: "this is a test"}}
      expect(response).to have_http_status(422)
    end
  end

  context "when description is nil" do
    it "respond with unprocessable entity" do
      post posts_path, params: {post: {author: "alando", title: "test", description: nil}}
      expect(response).to have_http_status(422)
    end
  end

  context "flash message" do
    it "to display correct flash message" do
      post posts_path, params: {post: {author: "alando", title: "test", description: "this is a test"}}
     expect(flash[:notice]).to eq("Post was successfully created.")
    end
  end
end