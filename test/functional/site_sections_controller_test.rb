require 'test_helper'

class SiteSectionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:site_sections)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_site_section
    assert_difference('SiteSection.count') do
      post :create, :site_section => { }
    end

    assert_redirected_to site_section_path(assigns(:site_section))
  end

  def test_should_show_site_section
    get :show, :id => site_sections(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => site_sections(:one).id
    assert_response :success
  end

  def test_should_update_site_section
    put :update, :id => site_sections(:one).id, :site_section => { }
    assert_redirected_to site_section_path(assigns(:site_section))
  end

  def test_should_destroy_site_section
    assert_difference('SiteSection.count', -1) do
      delete :destroy, :id => site_sections(:one).id
    end

    assert_redirected_to site_sections_path
  end
end
