# frozen_string_literal: true
require "rails_helper"

RSpec.feature "User Login", type: :feature, js: true do
  let(:user) { create(:user, first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password") }
  scenario "when password is valid" do
    visit "/sign_in"
    expect(page.body).to have_css("h1.title", text: "User Sign In")
    expect(page.body).to have_css("form input#user_email")
    expect(page.body).to have_css("form input#user_password")
    # expect(page.body).to have_css("button", text: "Login")
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
  
    click_on("Login")
    sleep(1)
    expect(page.body).to have_css("h1.title", text: "#{user.first_name}'s Profile")
    expect(page.body).to have_css("p.firstname", text: user.first_name)
    expect(page.body).to have_css("p.lastname", text: user.last_name)
    expect(page.body).to have_css("p.username", text: user.username)
    expect(page.body).to have_css("button", text: "Edit User")
    expect(page.body).to have_css("button", text: "Logout")
  end

  scenario "when password is invalid" do
    visit "/sign_in"
    expect(page.body).to have_css("h1.title", text: "User Sign In")
    expect(page.body).to have_css("form input#user_email")
    expect(page.body).to have_css("form input#user_password")
    # expect(page.body).to have_css("button", text: "Login")
    fill_in "Email", with: user.email
    fill_in "Password", with: "passwork"
    click_on("Login")
    sleep(1)
    expect(page.body).to have_css("h1.title", text: "User Sign In")
    expect(page.body).to have_css("form input#user_email")
    expect(page.body).to have_css("form input#user_password")
    # expect(page.body).to have_css("button", text: "Login")
  end
end