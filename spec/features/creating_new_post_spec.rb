# frozen_string_literal: true
require "rails_helper"

RSpec.feature "New Posts", type: :feature do
    scenario "adding a new post" do
      visit "/posts/new"
      fill_in "Author", with: "Willo"
      fill_in "Title", with: "Post"
      fill_in_trix_editor, with= "This is a Post"
      click_on("Submit Post")
    end
  end