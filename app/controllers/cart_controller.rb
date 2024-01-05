class CartController < ApplicationController
  before_action :set_orderable, only: %i[ remove ]
  before_action :set_product, only: %i[ update_quantity add ]

  def update_quantity
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    current_orderable.update(quantity: quantity)
  end

  def add
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)

    if current_orderable
      new_quantity = current_orderable.quantity + quantity
      current_orderable.update(quantity: new_quantity)
    else
      Orderable.create(cart: @cart, product_id: @product.id, quantity: quantity)
    end
  end

  def remove
    @orderable.destroy
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def set_orderable
    @orderable = Orderable.find_by(id: params[:id])
  end
end
