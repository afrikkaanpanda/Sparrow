# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET_new_user_path", type: :request do
    it "response to be ok" do
    get signup_path
    expect(response).to have_http_status(:ok)
  end
end