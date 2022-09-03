# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Editing a post", type: :feature do
  scenario "I can edit the posts on the page" do
    post = Post.create(author: "alando", title: "test", description: "this is a test")
    visit "/posts/#{post.id}/edit"
    expect(page.body).to have_css("h1.title", text: "Editing Post")
    expect(page.body).to have_css("form input#post_author")
    expect(page.body).to have_css("form input#post_title")
    expect(page.body).to have_css("trix-editor#post_description")
    expect(page.body).to have_css("form input[type=submit]")
    expect(page.body).to have_css("button", text: "Home")
  end
end