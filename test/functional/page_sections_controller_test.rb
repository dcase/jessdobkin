require 'test_helper'

class PageSectionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:page_sections)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_page_section
    assert_difference('PageSection.count') do
      post :create, :page_section => { }
    end

    assert_redirected_to page_section_path(assigns(:page_section))
  end

  def test_should_show_page_section
    get :show, :id => page_sections(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => page_sections(:one).id
    assert_response :success
  end

  def test_should_update_page_section
    put :update, :id => page_sections(:one).id, :page_section => { }
    assert_redirected_to page_section_path(assigns(:page_section))
  end

  def test_should_destroy_page_section
    assert_difference('PageSection.count', -1) do
      delete :destroy, :id => page_sections(:one).id
    end

    assert_redirected_to page_sections_path
  end
end
