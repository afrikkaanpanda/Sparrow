# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Deleting Posts", type: :feature, js: true do
  let(:post) { create(:post, author: "alando", title: "test", description: "this is a test") }
  scenario "deleting a post" do
    visit "/posts/#{post.id}"
    expect(page.body).to have_css("h1.title", text: "Post")
    expect(page.body).to have_css("p.ID", text: post.id)
    expect(page.body).to have_css("p.Author", text: "alando")
    expect(page.body).to have_css("p.Title", text: "test")
    expect(page.body).to have_css("p.Description", text: "this is a test")
    expect(page.body).to have_css("button", text: "Delete")
    expect(page.body).to have_css("button", text: "Edit Post")
    click_on("Delete")
    sleep(0.5)
    expect(page.body).to have_css("h1.title", text: "Welcome to Sparrow")
  end
end