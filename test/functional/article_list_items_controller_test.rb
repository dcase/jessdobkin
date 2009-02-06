require 'test_helper'

class ArticleListItemsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:article_list_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_article_list_item
    assert_difference('ArticleListItem.count') do
      post :create, :article_list_item => { }
    end

    assert_redirected_to article_list_item_path(assigns(:article_list_item))
  end

  def test_should_show_article_list_item
    get :show, :id => article_list_items(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => article_list_items(:one).id
    assert_response :success
  end

  def test_should_update_article_list_item
    put :update, :id => article_list_items(:one).id, :article_list_item => { }
    assert_redirected_to article_list_item_path(assigns(:article_list_item))
  end

  def test_should_destroy_article_list_item
    assert_difference('ArticleListItem.count', -1) do
      delete :destroy, :id => article_list_items(:one).id
    end

    assert_redirected_to article_list_items_path
  end
end
