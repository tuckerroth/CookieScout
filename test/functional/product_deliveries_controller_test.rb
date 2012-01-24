require 'test_helper'

class ProductDeliveriesControllerTest < ActionController::TestCase
  setup do
    @product = valid_product
    @product.save
    @new_product_delivery = ProductDelivery.new({:count => 2, :product => @product})
    @product_delivery = ProductDelivery.new({:count => 2, :product => @product})
    @product_delivery.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_deliveries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_delivery" do
    assert_difference('ProductDelivery.count',1) do
      post :create, product_delivery: @new_product_delivery.attributes
    end

    assert_redirected_to product_delivery_path(assigns(:product_delivery))
  end

  test "should show product_delivery" do
    get :show, id: @product_delivery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_delivery
    assert_response :success
  end

  test "should update product_delivery" do
    put :update, id: @product_delivery, product_delivery: @product_delivery.attributes
    assert_redirected_to product_delivery_path(assigns(:product_delivery))
  end

  test "should destroy product_delivery" do
    assert_difference('ProductDelivery.count', -1) do
      delete :destroy, id: @product_delivery
    end

    assert_redirected_to product_deliveries_path
  end

  def valid_product
    Product.new({:title => "Thin Mints", :price => 3.5})
  end
end
