# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Visiting the post index page", type: :feature do
  context "when posts are present" do
    scenario "I can see the posts on the page" do
      post = Post.create(author: "alando", title: "test", description: "this is a test")
      visit "/posts"
      expect(page.body).to have_css("h1.title", text: "Posts")
      expect(page.body).to have_css("p.author", text: post.author)
      expect(page.body).to have_css("p.title", text: post.title)
      expect(page.body).to have_css("p.description", text: post.description.to_plain_text)
      expect(page.body).to have_css("button", text: "Home")
    end
  end
    scenario "I cannot see posts on the page" do
      visit "/posts/"
      expect(page.body).to have_css("h1.title", text: "Posts")
      expect(page.body).to have_css("p.empty-state", text: "NO POSTS TO DISPLAY")
      expect(page.body).to have_css("button", text: "Home")
    end
end