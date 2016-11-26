class Order < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :order_recipes
  has_many :order_recipes

  def initialize(order)
    @ordered_recipes= order["recipes"]||{}

    order["description"]||={}
    @total=order["total"].to_i ||0
    @pickup_time = order["pickup_time"].to_i || 0
     @sub_total = order["sub_total"].to_i || 0
    @user = {}
    @invoice = ""
    @payment_id = ""
    @status = "pending"
  end

  def save_order(current_user)
   user = current_user
   new_order = user.orders.new(total: @total,vat: vat, delivery_cost: @delivery_cost, invoice: @invoice,
                                payment_id: @payment_id,
                                pickup_time: @total_pickup_time)
   if new_order.save
    @ordered_recipes.each do |index|
    new_order = order_recipes <<       
   
  end
end
