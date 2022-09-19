# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST_registration_path", type: :request do
    it "response to be ok" do
      post register_path, params: {user: {first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password"} }
      expect(response).to have_http_status(302)
  end

  context "when email is nil" do
    it "respond with unprocessable entity" do
      post register_path, params: {user: {first_name: "alando", last_name: "wilson", username: "panda.god", email: nil, password: "Password", password_confirmation: "Password"} }
      expect(response).to have_http_status(422)
    end
  end

  context "flash message" do
    it "to display correct flash message" do
      post register_path, params: {user: {first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password"} }
     expect(flash[:notice]).to eq("User successfully created")
    end
  end
end