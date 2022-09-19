# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET_edit_user_path", type: :request do
  let(:user) do
    {
      first_name: "alando",
      last_name: "wilson",
      email: "alando.willo@gmail.com",
      password: "Password",
      password_confirmation: "Password",
    }
  end

  it "response to be ok" do
    get "/users/#{user.id}/edit"
    expect(response).to have_http_status(:ok)
  end
end