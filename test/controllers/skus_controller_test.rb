require 'test_helper'

class SkusControllerTest < ActionController::TestCase
  setup do
    @sku = skus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:skus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sku" do
    assert_difference('Sku.count') do
      post :create, sku: { ceiling_price: @sku.ceiling_price, cost: @sku.cost, fba_status: @sku.fba_status, floor_price: @sku.floor_price, my_price: @sku.my_price, repricing_status: @sku.repricing_status, sku: @sku.sku, supplier: @sku.supplier, user_id: @sku.user_id }
    end

    assert_redirected_to sku_path(assigns(:sku))
  end

  test "should show sku" do
    get :show, id: @sku
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sku
    assert_response :success
  end

  test "should update sku" do
    patch :update, id: @sku, sku: { ceiling_price: @sku.ceiling_price, cost: @sku.cost, fba_status: @sku.fba_status, floor_price: @sku.floor_price, my_price: @sku.my_price, repricing_status: @sku.repricing_status, sku: @sku.sku, supplier: @sku.supplier, user_id: @sku.user_id }
    assert_redirected_to sku_path(assigns(:sku))
  end

  test "should destroy sku" do
    assert_difference('Sku.count', -1) do
      delete :destroy, id: @sku
    end

    assert_redirected_to skus_path
  end
end
