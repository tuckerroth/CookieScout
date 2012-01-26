class HomeController < ApplicationController

  def index

    #  Get summary data about Orders
    @order_summary = Order.summary
    @order_product_total = Order.total

    #  Get summary data about Inventory
    @product_delivery_summary = ProductDelivery.summary
    @product_delivery_total = ProductDelivery.total

    # Find how much product we have left-over
    @product_left = Hash.new
    @product_delivery_summary.each_pair do |pKey,pNumDelivered|
       @order_summary.each_pair do |orderKey,orderNumOrdered|
         #  Find the proper entry in orders that matches deliveries
         if pKey == orderKey
           # subtract number of products ordered from the number delivered
           product_left_over = Integer(pNumDelivered) - Integer(orderNumOrdered)
           @product_left[pKey] = product_left_over.to_s
         end
       end
    end

  end
end
