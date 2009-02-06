require 'test_helper'

class CopyTextsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:copy_texts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_copy_text
    assert_difference('CopyText.count') do
      post :create, :copy_text => { }
    end

    assert_redirected_to copy_text_path(assigns(:copy_text))
  end

  def test_should_show_copy_text
    get :show, :id => copy_texts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => copy_texts(:one).id
    assert_response :success
  end

  def test_should_update_copy_text
    put :update, :id => copy_texts(:one).id, :copy_text => { }
    assert_redirected_to copy_text_path(assigns(:copy_text))
  end

  def test_should_destroy_copy_text
    assert_difference('CopyText.count', -1) do
      delete :destroy, :id => copy_texts(:one).id
    end

    assert_redirected_to copy_texts_path
  end
end
