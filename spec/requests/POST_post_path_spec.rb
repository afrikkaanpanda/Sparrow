# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST_posts_path", type: :request do
  it "redirects to root_path" do
    post posts_path, params: { post: { author: "alando", title: "test", description: "this is a test" } }  
    expect(response).to redirect_to(root_path)
  end

  context "when title is nil" do
    it "responds with unprocessable entity" do
      post posts_path, params: { post: { author: "alando", title: nil, description: "this is a test" } } 
      expect(response).to have_http_status(422)
    end
  end
end