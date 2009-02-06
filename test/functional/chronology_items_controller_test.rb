require 'test_helper'

class ChronologyItemsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:chronology_items)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_chronology_item
    assert_difference('ChronologyItem.count') do
      post :create, :chronology_item => { }
    end

    assert_redirected_to chronology_item_path(assigns(:chronology_item))
  end

  def test_should_show_chronology_item
    get :show, :id => chronology_items(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => chronology_items(:one).id
    assert_response :success
  end

  def test_should_update_chronology_item
    put :update, :id => chronology_items(:one).id, :chronology_item => { }
    assert_redirected_to chronology_item_path(assigns(:chronology_item))
  end

  def test_should_destroy_chronology_item
    assert_difference('ChronologyItem.count', -1) do
      delete :destroy, :id => chronology_items(:one).id
    end

    assert_redirected_to chronology_items_path
  end
end
