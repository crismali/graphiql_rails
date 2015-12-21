require "rails_helper"

RSpec.describe "test what", js: true do
  it "is a test" do
    visit "https://google.com"
    expect(current_url).to eq("https://www.google.com/")
  end
end
