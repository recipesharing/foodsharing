class InvoicingController < ApplicationController
  before_action :authenticate_user!

  def create
  @torder_items = current_torder.torder_items
  @item_order = @torder_items.pluck(:recipe_id)
  @recipe_list = Recipe.all.where(:id=>@item_order)
  invoice = InvoicingLedgerItem.new(sender: 'foodfooding',
                                    recipient: current_user,
                                    currentcy:'vnd')
  
  invoice.line_items.build(description: 'Goodies: T-Shirt',
                         net_amount: 10, tax_amount: 0)

      if invoice.save
        flash[:success] = " you ordered successfully "
      end 
  end

end
