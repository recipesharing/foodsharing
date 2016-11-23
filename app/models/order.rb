class Order < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :order_recipes
  has_many :order_recipes



  def initialize(order)
    @order_recipes= order["recipes"]||{}

    order["description"]||={}
    @total=order["total"].to_i ||0
    @pickup_time = order["pickup_time"].to_i || 0
     @sub_total = order["sub_total"].to_i || 0
    @user = {}
    @invoice = ""
    @payment_id = ""
    @status = "pending"
  end
end
