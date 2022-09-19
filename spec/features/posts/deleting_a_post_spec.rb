# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Deleting Posts", type: :feature, js: true do
  scenario "deleting a post" do
    # let(:post) { create(:post, author: "alando", title: "test", description: "this is a test") }
    post = Post.create(author: "alando", title: "test", description: "this is a test")
    visit "/posts/#{post.id}"
    expect(page.body).to have_css("h1.title", text: "Post")
    expect(page.body).to have_css("p.ID", text: post.id)
    expect(page.body).to have_css("p.Author", text: post.author)
    expect(page.body).to have_css("p.Title", text: post.title)
    expect(page.body).to have_css("p.Description", text: post.description.to_plain_text)
    expect(page.body).to have_css("button", text: "Delete")
    expect(page.body).to have_css("button", text: "Edit Post")
    expect(page.body).to have_css("button", text: "All Posts")
    click_on("Delete")
    sleep(0.5)
    expect(page.body).to have_css("h1.title", text: "Welcome to Sparrow")
    expect(page.body).to have_css("button", text: "All Posts")
    expect(page.body).to have_css("button", text: "New Post")
  end
end