require 'test_helper'

class ChronologiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:chronologies)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_chronology
    assert_difference('Chronology.count') do
      post :create, :chronology => { }
    end

    assert_redirected_to chronology_path(assigns(:chronology))
  end

  def test_should_show_chronology
    get :show, :id => chronologies(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => chronologies(:one).id
    assert_response :success
  end

  def test_should_update_chronology
    put :update, :id => chronologies(:one).id, :chronology => { }
    assert_redirected_to chronology_path(assigns(:chronology))
  end

  def test_should_destroy_chronology
    assert_difference('Chronology.count', -1) do
      delete :destroy, :id => chronologies(:one).id
    end

    assert_redirected_to chronologies_path
  end
end
