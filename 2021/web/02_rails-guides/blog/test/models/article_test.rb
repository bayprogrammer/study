require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new(body: "Never let a good crisis go to waste.")
    assert_not article.save, "Saved the article without a title"
  end

  test "should not save article without body" do
    article = Article.new(title: "The Tyrants' Manifesto")
    assert_not article.save, "Saved the article without a body"
  end

  test "should not save article with too short a body" do
    article = Article.new(title: "The Tyrants' Manifesto")
    article.body = "Never..."
    assert_not article.save, "Saved the article too short a body"
  end
end
