require 'test_helper'

class InventoriesControllerTest < ActionController::TestCase
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post :create, inventory: { alert: @inventory.alert, asin: @inventory.asin, bb: @inventory.bb, ceiling: @inventory.ceiling, competitor: @inventory.competitor, condition: @inventory.condition, fba: @inventory.fba, fbalowest: @inventory.fbalowest, has_amazon: @inventory.has_amazon, lowest: @inventory.lowest, price: @inventory.price, ranking: @inventory.ranking, sku: @inventory.sku, stock: @inventory.stock, title: @inventory.title }
    end

    assert_redirected_to inventory_path(assigns(:inventory))
  end

  test "should show inventory" do
    get :show, id: @inventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory
    assert_response :success
  end

  test "should update inventory" do
    patch :update, id: @inventory, inventory: { alert: @inventory.alert, asin: @inventory.asin, bb: @inventory.bb, ceiling: @inventory.ceiling, competitor: @inventory.competitor, condition: @inventory.condition, fba: @inventory.fba, fbalowest: @inventory.fbalowest, has_amazon: @inventory.has_amazon, lowest: @inventory.lowest, price: @inventory.price, ranking: @inventory.ranking, sku: @inventory.sku, stock: @inventory.stock, title: @inventory.title }
    assert_redirected_to inventory_path(assigns(:inventory))
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete :destroy, id: @inventory
    end

    assert_redirected_to inventories_path
  end
end
