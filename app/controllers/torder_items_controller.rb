# order item controller
class TorderItemsController < ApplicationController
  def create
    # debugger
    @torder = current_torder
    @torder_item = @torder.torder_items.new(torder_item_params)
    @torder.save
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
    @torder_item.destroy
    @torder_items = @torder.torder_items
  end

  private

  def torder_item_params
    params.require(:torder_item).permit(:quantity, :recipe_id)
  end
end
