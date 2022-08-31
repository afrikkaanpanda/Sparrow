# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Visit Post Index Page", type: :feature do
    scenario "visit Post Index Page with Posts" do
        post= Post.create(author: "", title: "", description: "")
      visit "/posts"
      expect(page.body).to have_css("h1.title", text: "Posts")
      expect(page.body).to have_text(post.author)
      expect(page.body).to have_text(post.title)
      expect(page.body).to have_text(post.description.to_plain_text)
      expect(page.body).to have_css("button", text: "Home")
    
    end
  end