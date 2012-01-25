require 'test_helper'

class ProductDeliveryTest < ActiveSupport::TestCase

  setup do
    # Set up some products
    @product_thin_mints = Product.new({:title => "Thin Mints", :price => 3.5})
    @product_thin_mints.save

    @product_samoas = Product.new({:title => "Samoas", :price => 3.5})
    @product_samoas.save

    @product_dip_di_dos = Product.new({:title => "Dip-di-dos", :price => 3.5})
    @product_dip_di_dos.save

    @product_canibus_cookies = Product.new({:title => "Canibus-Cookies", :price => 3.5})
    @product_canibus_cookies.save

  end

  test "Is invalid without count" do
    p_delivery = ProductDelivery.new({:product => valid_product, :count => nil})
    assert !p_delivery.valid?
  end

  test "Is invalid without a product" do
    p_delivery = ProductDelivery.new({:product => nil, :count => 6})
    assert !p_delivery.valid?
  end

  test "Summary works" do
    product_delivery_1 = ProductDelivery.new({:product => @product_thin_mints, :count => 4})
    product_delivery_1.save

    product_delivery_2 = ProductDelivery.new({:product => @product_thin_mints, :count => 6})
    product_delivery_2.save

    product_delivery_3 = ProductDelivery.new({:product => @product_samoas, :count => 100})
    product_delivery_3.save

    product_delivery_3 = ProductDelivery.new({:product => @product_dip_di_dos, :count => 20})
    product_delivery_3.save

    summary = ProductDelivery.summary

    assert summary.size == 3
    thin_mints_count = summary["Thin Mints"]

    assert thin_mints_count.eql?("10")
  end

  test "Product totals works" do
    product_delivery_1 = ProductDelivery.new({:product => @product_thin_mints, :count => 4})
    product_delivery_1.save

    product_delivery_2 = ProductDelivery.new({:product => @product_thin_mints, :count => 6})
    product_delivery_2.save

    product_delivery_3 = ProductDelivery.new({:product => @product_samoas, :count => 100})
    product_delivery_3.save

    product_delivery_3 = ProductDelivery.new({:product => @product_dip_di_dos, :count => 20})
    product_delivery_3.save

    total = ProductDelivery.total

    assert total.eql?("130")
  end

  def valid_product
    Product.new({:title => "Thin Mints", :price => 3.5})
  end
end
