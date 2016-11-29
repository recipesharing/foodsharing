class Order < ApplicationRecord
  belongs_to :user
  has_many :recipes, through: :order_recipes
  has_many :order_recipes

  def initialize(order)
    @ordered_recipes= order["recipes"]||{}

    order["details"]||={}
    @total=order["details"]["total"].to_i ||0
    @pickup_time = order["details"]["pickup_time"].to_i || 0
     @sub_total = order["details"]["sub_total"].to_i || 0
    @user = {}
    # @invoice = ""
    # @payment_id = ""
    @status = "pending"
  end

  def update_order(order, args)
    @ordered_recipes = order["recipes"] || {}
    @total = order["details"]["total"] || 0
    @pickup_time = order["details"]["pickup_time"].to_i || 0
    @total_pickup_time = add_extra_time(@pickup_time)
    # @invoice = args[:invoice] || ""
    # @transaction_id = args[:transaction_id] || ""
    @status = args[:status] || "pending"
  end

  
  def save_order(current_user)
   user = current_user
   new_order = user.orders.new(total: @total,vat: vat, 
                                    pickup_time: @total_pickup_time)
        if new_order.save
          @ordered_recipes.each do |index, details|
          new_order = order_recipes <<   
                OrderRecipe.create(recipe_id: details["recipe"]["id"],
                                 quantity: details["quantity"])
          end
        end
    new_order.save
  end     
 
end
