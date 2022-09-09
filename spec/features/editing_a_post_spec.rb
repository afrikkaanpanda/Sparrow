# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Editing Posts", type: :feature do
  let(:post) { create(:post) }
  scenario "editing a post" do
        visit "/posts/#{post.id}/edit"
        fill_in "Author", with: "Willo"
        fill_in "Title", with: "Post"
        fill_in_trix_editor, with= "This is a Post"
        click_on("Submit Post")

        
        expect(page.body).to have_text: ("Author:")
        expect(page.body).to have_text: ("Title:")
        expect(page.body).to have_text: ("Description:")
        expect(page.body).to have_css("button", text: "Delete")
        expect(page.body).to have_css("button", text: "Edit Post")
        expect(page.body).to have_css("button", text: "All Posts")
  end
end