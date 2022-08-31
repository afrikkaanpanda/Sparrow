# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Post", type: :request do
    it "redirect to main page" do
      get root_path
        respond_to redirect_to '/'
        expect(response).to have_http_status(:ok)
    end
end