class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id]).order("created_at DESC")
    @user_reviewed = Review.find_by user_id: session[:user_id], product_id: params[:id]
    @current_user_id = session[:user_id]
  end

  def destroy
    @review = Review.find_by product_id: params[:id]
    @review.destroy
    redirect_to :product, notice: 'Review removed!'
  end

end
