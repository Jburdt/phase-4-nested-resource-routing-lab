class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message


  def index
    items = Item.all
    render json: items, include: :user
  end

  def show
    render json: Item.find_by(id: params[:id])
  end

  def create
    user = User.find(params[:user_id])
    items = user.items.create(item_params)
    render json: items, include: :user, status: :created 
  end

  private

  def render_not_found_message
    render json: { error: "User not found" }, status: :not_found 
  end

  def item_params
    params.permit(:name, :description, :price)
  end

end
