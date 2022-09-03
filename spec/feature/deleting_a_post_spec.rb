# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Deleting a post", type: :feature do
  scenario "I can delete the posts on the page" do
    post = Post.create(author: "alando", title: "test", description: "this is a test")
    visit "/posts/#{post.id}"
    expect(page.body).to have_css("h1.title", text: "Post")
  
    expect(page.body).to have_text(post.author)
    expect(page.body).to have_text(post.title)
    expect(page.body).to have_text(post.description.to_plain_text)
    expect(page.body).to have_css("button", text: "Edit Post")
    expect(page.body).to have_css("button", text: "Delete Post")
    expect(page.body).to have_css("button", text: "All Posts")
    click_on("Delete Post")
    expect(page.body).to have_css("h1.title", text: "Welcome to Sparrow")
    expect(page.body).to have_css("button", text: "All Posts")
    expect(page.body).to have_css("button", text: "New Post")

  end
end