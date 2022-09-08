# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET_new_post_path", type: :request do
    it "response to be ok" do
    get new_post_path
    expect(response).to have_http_status(:ok)
  end

  context "to be redirected" do
    it "redirects to root_path" do
      get new_post_path
      expect(response).to have_http_status(302)
    end
  end
end