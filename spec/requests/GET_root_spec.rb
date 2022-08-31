# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Post", type: :request do
    it "response to be ok" do
    get root_path
    expect(response).to have_http_status(:ok)
  end
end