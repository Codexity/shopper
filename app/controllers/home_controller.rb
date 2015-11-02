class HomeController < ApplicationController
  def index
    @products_only = Shoppe::Product.root
    @products = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
    @products = @products.group_by(&:product_category)
  end
end
