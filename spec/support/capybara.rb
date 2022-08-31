# frozen_string_literal: true

require "rack_session_access/capybara"

RSpec.configure do
  Capybara.register_driver :selenium do |app|
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument("--no-sandbox")
    Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: options)
  end

  Capybara.app_host = "http://lvh.me"
  Capybara.default_host = "http://lvh.me"
  Capybara.configure do |config|
    config.always_include_port = true
  end

  def login(user = create(:user))
    page.set_rack_session(user_id: user.id)
  end

  def fill_in_trix_editor(id, with:)
    find(:xpath, "//trix-editor[@input='#{id}']").click.set(with)
  end
end
