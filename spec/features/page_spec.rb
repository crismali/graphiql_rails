require "rails_helper"

RSpec.describe "Page", js: true do
  it "has documentation" do
    visit graphiql_rails_path
    find(".docExplorerShow").click
    find(".type-name", text: "Query").click
    expect(page).to have_text("The query root of this schema. Pretty sweet, right?")
    find(".type-name", text: "Post").click
    expect(page).to have_text("A blog post")
  end

  context "specifying a graphql endpoint" do
    it "can be specified" do
      visit graphiql_rails_path
      find(".docExplorerShow").click
      find(".type-name", text: "Query").click
      expect(page).to have_text("The query root of this schema. Pretty sweet, right?")

      visit specified_graphiql_rails_path
      find(".docExplorerShow").click
      find(".type-name", text: "Query").click
      expect(page).to have_text("Super specified")
    end
  end
end
