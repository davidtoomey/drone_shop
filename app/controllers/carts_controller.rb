class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
  end
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      if (current_user.try(:admin?) || current_user.try(:employee?))
        format.html { redirect_to cart_path, notice: "Your cart is currently empty." }
      else
        format.html { redirect_to products_path, notice: "Your cart is currently empty." }
      end
      format.js
      format.json { head :no_content }
    end
  end
end