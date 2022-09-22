# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Visit Post Index Page", type: :feature, js: true do
  context "when posts are present" do
    scenario "visit Post Index Page with no Posts" do
      visit "/posts"
      expect(page.body).to have_css("h1.title", text: "Posts")
      expect(page.body).to have_css("p.empty-state", text: "NO POST TO DISPLAY")
    end
  end
end