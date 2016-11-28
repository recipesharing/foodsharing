class Cart
  attr_reader :cart_data

  def initialize(cart_data)
    @cart_data = cart_data || {}
  end

  def increment(recipe_id)
    @cart_data[recipe_id] ||= 0
    increment_cart_recipe_by_one(recipe_id)
  end

  def destroy
    @cart_data = nil
  end

  def delete recipe_id
    @cart_data[recipe_id] = 0
  end

  private

  def increment_cart_recipe_by_one(recipe_id)
    @cart_data[recipe_id] += 1
  end
end
