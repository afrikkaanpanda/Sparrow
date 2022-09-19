# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Editing Posts", type: :feature do
  scenario "editing a post" do
    post = Post.create(author: "alando", title: "test", description: "this is a test")
    visit "/posts/#{post.id}/edit"
    fill_in "Author", with: "alando"
    fill_in "Title", with: "test"
    fill_in_trix_editor, with= "This is a Post"
    click_on("Submit Post")
    expect(page.body).to have_css("h1.title", text: "Post")
    expect(page.body).to have_css("p.ID", text: post.id)
    expect(page.body).to have_css("p.Author", text: post.author)
    expect(page.body).to have_css("p.Title", text: post.title)
    expect(page.body).to have_css("p.Description", text: post.description.to_plain_text)
    expect(page.body).to have_css("button", text: "Edit Post")
    expect(page.body).to have_css("button", text: "All Posts")
  end
end