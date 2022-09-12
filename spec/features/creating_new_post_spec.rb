# frozen_string_literal: true
require "rails_helper"

RSpec.feature "New Posts", type: :feature, js: true do
  let(:author) {"alando"}
  let(:title) {"test"}
  let(:description) {"this is a post"}

  scenario "adding a new post" do
    visit "/posts/new"
    fill_in "Author", with: author
    fill_in "Title", with: title
    fill_in_trix_editor "post_description_trix_input_post", with: description
    click_on("Submit Post")
    sleep(0.5)
    expect(page.body).to have_css("h1.title", text: "Post")
    expect(page.body).to have_css("p.ID", text: Post.last.id )
    expect(page.body).to have_css("p.Author", text: author)
    expect(page.body).to have_css("p.Title", text: title)
    expect(page.body).to have_css("p.Description", text: description)
    expect(page.body).to have_css("button", text: "Delete")
    expect(page.body).to have_css("button", text: "Edit Post")
    expect(page.body).to have_css("button", text: "All Posts")
  end
end