# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Editing Posts", type: :feature, js: true do
  let(:post) { create(:post, author: "alando", title: "test", description: "this is a test") }
  scenario "editing a post" do
    visit "/posts/#{post.id}/edit"
    fill_in "Author", with: "alando"
    fill_in "Title", with: "test"
    fill_in_trix_editor, with= "This is a Post"
    click_on("Submit Post")
    sleep(0.5)
    expect(page.body).to have_css("h1.title", text: "Post")
    expect(page.body).to have_css("p.ID", text: post.id)
    expect(page.body).to have_css("p.Author", text: "alando")
    expect(page.body).to have_css("p.Title", text: "test")
    expect(page.body).to have_css("p.Description", text: post.description.to_plain_text)
    expect(page.body).to have_css("button", text: "Delete")
    expect(page.body).to have_css("button", text: "Edit Post")
  end
end