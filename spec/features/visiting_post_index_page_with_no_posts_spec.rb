# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Visit Post Index Page", type: :feature do
    scenario "visit Post Index Page with no Posts" do
      visit "/posts"
      expect(page.body).to have_css("h1.title", text: "Posts")
      expect(page.body).to have_text ("NO POST TO DISPLAY")
      expect(page.body).to have_css("button", text: "Home")
    end
  end