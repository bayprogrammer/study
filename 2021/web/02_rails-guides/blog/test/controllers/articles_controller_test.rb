require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # called before every single test
  setup do
    @article = articles(:one)
  end

  # called after every single test
  teardown do
    # when controller is using caching it may be a good idea to reset it
    # afterwards
    Rails.cache.clear
  end

  test "should get index" do
    get articles_url

    assert_equal "index", @controller.action_name
    #assert_equal "application/x-www-form-urlencoded", @request.media_type
    assert_match "Articles", @response.body
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: {
        body: "Rails is awesome!",
        title: "Hello Rails"
      }}
    end

    assert_redirected_to article_path(Article.last)
    assert_equal "Article was successfully created.", flash[:notice]
  end

  test "should show article" do
    # Reuse the @article instance variable from setup
    get article_url(@article)
    assert_response :success
  end

  test "should destroy article" do
    assert_difference("Article.count", -1) do
      delete article_url(@article)
    end

    assert_redirected_to root_path
  end

  test "should update article" do
    patch article_url(@article), params: { article: { title: "updated" } }

    assert_redirected_to article_path(@article)
    # Reload association to fetch updated data and assert that title is updated
    @article.reload
    assert_equal "updated", @article.title
  end
end
