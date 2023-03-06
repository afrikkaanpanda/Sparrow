# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST_sessions_path", type: :request do
 let(:user) { create(:user, first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password") }
 context "when email and password is correct" do 
    it "response to be redirected" do
      post login_path, params: { user: {email: user.email, password: user.password} }
      expect(response).to have_http_status(:redirect)
    end
  end

  context "when email is nil" do
    it "response to be unprocessible entity" do
      post login_path, params: { user: {email: nil , password: user.password} }
      expect(response).to have_http_status(422)
    end
  end

  context "flash message" do 
    it "when params correct" do
      post login_path, params: { user: {email: user.email, password: user.password} }
      expect(flash[:notice]).to eq("Successfully logged in!")
    end
  end

  context "flash message" do
    it "when params incorrect" do
      post login_path, params: { user: {email: user.email, password: nil} }
      expect(flash[:notice]).to eq("Invalid email or password")
    end
  end
end