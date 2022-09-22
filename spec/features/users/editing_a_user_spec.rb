# frozen_string_literal: true
require "rails_helper"

RSpec.feature "New User", type: :feature, js: true do
  let(:user) { create(:user, first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password") }
  scenario "editing a user" do  
    visit "/users/#{user.id}"
    expect(page.body).to have_css("h1.title", text: "alando's Profile")
    expect(page.body).to have_css("p.firstname", text: "alando")
    expect(page.body).to have_css("p.lastname", text: "wilson")
    expect(page.body).to have_css("p.username", text: "panda.god")
    expect(page.body).to have_css("button", text: "Edit User")
    expect(page.body).to have_css("button", text: "Logout")
    click_on("Edit User")
    fill_in "First name", with: "alando"
    fill_in "Last name", with: "wilson"
    fill_in "Username", with: "panda.god1"
    click_on("Update")
sleep(0.5)
    expect(page.body).to have_css("h1.title", text: "alando's Profile")
    expect(page.body).to have_css("p.firstname", text: "alando")
    expect(page.body).to have_css("p.lastname", text: "wilson")
    expect(page.body).to have_css("p.username", text: "panda.god1")
  end
end
