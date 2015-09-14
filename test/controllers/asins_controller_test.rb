require 'test_helper'

class AsinsControllerTest < ActionController::TestCase
  setup do
    @asin = asins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asin" do
    assert_difference('Asin.count') do
      post :create, asin: { asin: @asin.asin, brand: @asin.brand, category: @asin.category, img_url: @asin.img_url, ranking: @asin.ranking, sku_id: @asin.sku_id, title: @asin.title }
    end

    assert_redirected_to asin_path(assigns(:asin))
  end

  test "should show asin" do
    get :show, id: @asin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asin
    assert_response :success
  end

  test "should update asin" do
    patch :update, id: @asin, asin: { asin: @asin.asin, brand: @asin.brand, category: @asin.category, img_url: @asin.img_url, ranking: @asin.ranking, sku_id: @asin.sku_id, title: @asin.title }
    assert_redirected_to asin_path(assigns(:asin))
  end

  test "should destroy asin" do
    assert_difference('Asin.count', -1) do
      delete :destroy, id: @asin
    end

    assert_redirected_to asins_path
  end
end
