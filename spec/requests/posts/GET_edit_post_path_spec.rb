# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET_edit_post_path", type: :request do
    let(:post) { create(:post) }
  it "response to be ok" do
      get "/posts/#{post.id}"
      expect(response).to have_http_status(:ok)
  end
end