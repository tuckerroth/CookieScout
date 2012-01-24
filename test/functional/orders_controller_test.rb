require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @product = valid_product
    @product.save
    @new_order = Order.new({:count => 2, :name => "Arthur", :product_id => @product.id})
    @order = Order.new({:count => 2, :name => "Arthur", :product_id => @product.id})
    @order.save
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: @new_order.attributes
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order, order: @order.attributes
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end

  def valid_product
    Product.new({:title => "Thin Mints", :price => 3.5})
  end
end
