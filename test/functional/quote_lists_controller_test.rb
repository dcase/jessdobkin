require 'test_helper'

class QuoteListsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:quote_lists)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_quote_list
    assert_difference('QuoteList.count') do
      post :create, :quote_list => { }
    end

    assert_redirected_to quote_list_path(assigns(:quote_list))
  end

  def test_should_show_quote_list
    get :show, :id => quote_lists(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => quote_lists(:one).id
    assert_response :success
  end

  def test_should_update_quote_list
    put :update, :id => quote_lists(:one).id, :quote_list => { }
    assert_redirected_to quote_list_path(assigns(:quote_list))
  end

  def test_should_destroy_quote_list
    assert_difference('QuoteList.count', -1) do
      delete :destroy, :id => quote_lists(:one).id
    end

    assert_redirected_to quote_lists_path
  end
end
