# frozen_string_literal: true
require "rails_helper"

RSpec.feature "New Posts", type: :feature do
  scenario "adding a new post" do
    post= Post.create(author: "", title: "", description: "")
  
    visit "/posts/new"
    fill_in "Author", with: "Willo"
    fill_in "Title", with: "Post"
    fill_in_trix_editor, with= "This is a Post"
    click_on("Submit Post")

    expect(page.body).to have_text(post.author)
    expect(page.body).to have_text(post.title)
    expect(page.body).to have_text(post.description.to_plain_text)
    expect(page.body).to have_css("button", text: "Home")
  end
end