require 'test_helper'

class ArticleListsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:article_lists)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_article_list
    assert_difference('ArticleList.count') do
      post :create, :article_list => { }
    end

    assert_redirected_to article_list_path(assigns(:article_list))
  end

  def test_should_show_article_list
    get :show, :id => article_lists(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => article_lists(:one).id
    assert_response :success
  end

  def test_should_update_article_list
    put :update, :id => article_lists(:one).id, :article_list => { }
    assert_redirected_to article_list_path(assigns(:article_list))
  end

  def test_should_destroy_article_list
    assert_difference('ArticleList.count', -1) do
      delete :destroy, :id => article_lists(:one).id
    end

    assert_redirected_to article_lists_path
  end
end
