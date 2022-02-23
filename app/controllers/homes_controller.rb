class HomesController < ApplicationController
  def index
    @most_sales_product=Order.select("customer_id, sum(quantity) as Sum_of_Quantity").group("customer_id").order("Sum_of_Quantity desc").first(3)
    @top_three_customer_by_sum_of_price = Order.group("customer_id").having(status:'booked').first(5)
    @top_five_customer_by_maximum_booked_order = Order.group("customer_id").having(status:'cancelled').first(5)
    @top_five_customer_by_maximum_canceled_order = Order.group("customer_id").having(status:'cancelled').first(5) 
  end
end

