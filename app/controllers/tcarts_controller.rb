class TcartsController < ApplicationController
  def show
    @torder_items = current_torder.torder_items
  end
end
