# frozen_string_literal: true
require "rails_helper"

RSpec.feature "New User", type: :feature, js: true do

  let(:first_name) {"alando"}
  let(:last_name)  {"wilson"}
  let(:username)   {"panda.god"}
  let(:email)      {"alando.willo@gmail.com"}
  let(:password)   {"Password"}
  let(:password_confirmation) {"Password"} 

  scenario "create a new user" do
    visit "/signup"
    expect(page.body).to have_css("h1.title", text: "New User")
    expect(page.body).to have_css("form input#user_first_name")
    expect(page.body).to have_css("form input#user_last_name")
    expect(page.body).to have_css("form input#user_username")
    expect(page.body).to have_css("form input#user_password")
    expect(page.body).to have_css("form input#user_password_confirmation")
    
    fill_in "First name", with: first_name
    fill_in "Last name", with: last_name
    fill_in "Username", with: username
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password_confirmation
    click_on("Create User")
    sleep(1)
    expect(page.body).to have_css("h1.title", text: "#{first_name}'s Profile")
    expect(page.body).to have_css("p.firstname", text: first_name)
    expect(page.body).to have_css("p.lastname", text: last_name)
    expect(page.body).to have_css("p.username", text: username)
    expect(page.body).to have_css("button", text: "Edit User")
    expect(page.body).to have_css("button", text: "Logout")
  end
end