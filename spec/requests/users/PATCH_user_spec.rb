# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PATCH_user_path", type: :request do
  let(:user) { create(:user, first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password") }

  it "response to be ok" do
    patch "/users/#{user.id}", params: {user: {first_name: "alando", last_name: "wilson", username: "panda.god1"} }
    expect(response).to redirect_to(user)
  end

  context "when username is nil" do
    it "respond with unprocessible entity" do 
      patch "/users/#{user.id}", params: {user: {first_name: "alando", last_name: "wilson", username: nil} }
      expect(response).to have_http_status(422)
    end
  end

  context "flash messages" do 
    it "to display correct flash message" do
      patch "/users/#{user.id}", params: {user: {first_name: "alando", last_name: "wilson", username: "panda.god1"} }
      expect(flash[:notice]).to eq ("User was successfully updated.")
    end
  end
end