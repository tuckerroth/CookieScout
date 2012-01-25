class HomeController < ApplicationController

  def index

    #  Get summary data about Orders
    @order_summary = Order.summary
    @order_product_total = Order.total

    #  Get summary data about Inventory
    @product_delivery_summary = ProductDelivery.summary
    @product_delivery_total = ProductDelivery.total
  end
end
