# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Visiting a User page", type: :feature, js: true do
  scenario "visiting a user" do
    user = User.create(first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password")
    visit "/users/#{user.id}"
    expect(page.body).to have_css("h1.title", text: "alando's Profile")
    expect(page.body).to have_css("p.firstname", text: "alando")
    expect(page.body).to have_css("p.lastname", text: "wilson")
    expect(page.body).to have_css("p.username", text: "panda.god")
    expect(page.body).to have_css("button", text: "Edit User")
    expect(page.body).to have_css("button", text: "Home")
  end
end