# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Visit Post Index Page", type: :feature do
  context "when posts are present" do
    scenario "visit Post Index Page with no Posts" do
      visit "/posts"
      expect(page.body).to have_css("h1.title", text: "Posts")
      binding.pry
      expect(page.body).to have_css("p.empty-state", text: "NO POST TO DISPLAY")
      expect(page.body).to have_css("button", text: "Home")
    end
  end
end