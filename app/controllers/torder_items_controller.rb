# order item controller
class TorderItemsController < ApplicationController
  def create
    # debugger
    @torder = current_torder
    #binding.pry
    check_exists = @torder.torder_items.select{|i| i.recipe_id == torder_item_params['recipe_id'].to_i}
    if check_exists.present?  
      old_order = check_exists.first
      old_order.quantity = old_order.quantity.to_i + 1
      old_order.save
    else 
      @torder_item = @torder.torder_items.new(torder_item_params)
      @torder.save
    end

    
    session[:torder_id] = @torder.id
  end

  def update
    @torder = current_torder
    @torder_item = @torder.torder_items.find(params[:id])
    @torder_item.update_attributes(torder_item_params)
    @torder_items = @torder.torder_items
  end

  def destroy
    @torder = current_torder
    @torder_item = @torder.torder_items.find(params[:id])
    @torder_item_id = @torder_item.id
    @torder_item.destroy
    @torder_items = @torder.torder_items
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end

  private
  def torder_item_params
    params.require(:torder_item).permit( :quantity, :recipe_id)
  end
end
