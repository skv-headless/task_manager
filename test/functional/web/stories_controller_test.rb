require 'test_helper'

class Web::StoriesControllerTest < ActionController::TestCase
  setup do
    @story = create(:story)
    @user = @story.assigned_to
    sign_in(@user)
  end

  test 'unauthorized response' do
    sign_out
    get :index
    assert_response :redirect
  end

  test 'index' do
    get :index
    assert_response :success
  end

  test 'filtered index' do
    get :index, :assigned_to_id => @user
    assert_response :success

    assert_select 'table' do |elements|
      assert_select 'tr', 2 # header + 1 element
    end

    get :index, :state => 'new'
    assert_select 'table' do |elements|
      assert_select 'tr', 2 # header + 1 elements
    end
  end

  test 'new' do
    get :new
    assert_response :success
  end

  test 'create' do
    attrs = attributes_for(:story)
    post :create, story: attrs
    assert_response :redirect

    story = Story.where(:title => attrs[:title]).first
    assert { story }
  end

  test 'show' do
    get :show, id: @story
    assert_response :success
  end

  test 'edit' do
    get :edit, id: @story
    assert_response :success
  end

  test 'update' do
    attrs = attributes_for(:story).extract!(:description, :title)
    put :update, id: @story, story: attrs
    assert_response :redirect

    @story.reload
    assert { attrs[:title] == @story.title }
  end

  test 'email sending on update assigned' do
    second_user = create(:user)
    assert_difference 'ActionMailer::Base.deliveries.size', +1 do
      put :update, id: @story, story: {
          assigned_to_id: second_user,
      }
    end
  end

  test 'destroy' do
    delete :destroy, id: @story
    assert_response :redirect

    assert { !Story.exists?(:id => @story) }
  end
end
