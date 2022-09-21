# frozen_string_literal: true
require "rails_helper"

RSpec.feature "New Session", type: :feature, js: true do
  let(:user) { create(:user, first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password") }
  scenario "creating a new session" do
    visit "/sign_in"
    expect(page.body).to have_css("h1.title", text: "User Sign In")
    expect(page.body).to have_css("form input#user_email")
    expect(page.body).to have_css("form input#user_password")
    expect(page.body).to have_css("button", text: "Login")
    fill_in "Email", with: "alando.willo@gmail.com"
    fill_in "Password", with: "Password"
    click_on


  end
end