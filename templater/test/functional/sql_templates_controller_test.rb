require 'test_helper'

class SqlTemplatesControllerTest < ActionController::TestCase
  setup do
    @sql_template = sql_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sql_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sql_template" do
    assert_difference('SqlTemplate.count') do
      post :create, :sql_template => @sql_template.attributes
    end

    assert_redirected_to sql_template_path(assigns(:sql_template))
  end

  test "should show sql_template" do
    get :show, :id => @sql_template.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @sql_template.to_param
    assert_response :success
  end

  test "should update sql_template" do
    put :update, :id => @sql_template.to_param, :sql_template => @sql_template.attributes
    assert_redirected_to sql_template_path(assigns(:sql_template))
  end

  test "should destroy sql_template" do
    assert_difference('SqlTemplate.count', -1) do
      delete :destroy, :id => @sql_template.to_param
    end

    assert_redirected_to sql_templates_path
  end
end
