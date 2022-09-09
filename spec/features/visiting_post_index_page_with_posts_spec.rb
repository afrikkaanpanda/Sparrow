# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Visit Post Index Page", type: :feature do
  context "when posts are present" do
    scenario "visit Post Index Page with Posts" do
      post = Post.create(author: "alando", title: "test", description: "this is a test")
      visit "/posts"
      expect(page.body).to have_css("h1.title", text: "Posts")
      expect(page.body).to have_css("p.title", text: post.id)
      expect(page.body).to have_css("p.title", text: post.author)
      expect(page.body).to have_css("p.title", text: post.title)
      expect(page.body).to have_css("p.title", text: post.description.to_plain_text)
      expect(page.body).to have_css("button", text: "Show This Post")
      expect(page.body).to have_css("button", text: "Home")
    end
  end

  context "when posts are not present" do
    scenario "visit Post Index Page with no Posts" do
      visit "/posts"
      expect(page.body).to have_css("h1.title", text: "Posts")
      expect(page.body).to have_css("p.empty-state", text: "NO POST TO DISPLAY")
      expect(page.body).to have_css("button", text: "Home")
    end
  end
end