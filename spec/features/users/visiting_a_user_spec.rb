# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Visiting a User page", type: :feature, js: true do
  let(:user) { create(:user, first_name: "alando", last_name: "wilson", username: "panda.god", email: "alando.willo@gmail.com", password: "Password", password_confirmation: "Password") }
  scenario "visiting a user" do
    visit "/users/#{user.id}"
    expect(page.body).to have_css("h1.title", text: "alando's Profile")
    expect(page.body).to have_css("p.firstname", text: "alando")
    expect(page.body).to have_css("p.lastname", text: "wilson")
    expect(page.body).to have_css("p.username", text: "panda.god")
  end
end