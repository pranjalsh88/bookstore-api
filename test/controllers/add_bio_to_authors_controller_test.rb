require 'test_helper'

class AddBioToAuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add_bio_to_author = add_bio_to_authors(:one)
  end

  test "should get index" do
    get add_bio_to_authors_url, as: :json
    assert_response :success
  end

  test "should create add_bio_to_author" do
    assert_difference('AddBioToAuthor.count') do
      post add_bio_to_authors_url, params: { add_bio_to_author: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show add_bio_to_author" do
    get add_bio_to_author_url(@add_bio_to_author), as: :json
    assert_response :success
  end

  test "should update add_bio_to_author" do
    patch add_bio_to_author_url(@add_bio_to_author), params: { add_bio_to_author: {  } }, as: :json
    assert_response 200
  end

  test "should destroy add_bio_to_author" do
    assert_difference('AddBioToAuthor.count', -1) do
      delete add_bio_to_author_url(@add_bio_to_author), as: :json
    end

    assert_response 204
  end
end
