# frozen_string_literal: true
require "rails_helper"

RSpec.feature "User Logout", type: :feature, js: true do
  let(:user) { create(:user, first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password") }
  scenario "logging out" do
    visit "/users/#{user.id}"
    expect(page.body).to have_css("h1.title", text: "#{user.first_name}'s Profile")
    expect(page.body).to have_css("p.firstname", text: user.first_name)
    expect(page.body).to have_css("p.lastname", text: user.last_name)
    expect(page.body).to have_css("p.username", text: user.username)
    expect(page.body).to have_css("button", text: "Edit User")
    expect(page.body).to have_css("button", text: "Logout")
    click_on("Logout")
    sleep(1)
    expect(page.body).to have_css("h1.title", text: "Welcome to Sparrow")
  end
end