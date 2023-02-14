class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end
  
  def user_items
    user = User.find(params[:user_id])
    items = user.items
    render json: items, include: :user
  end
  
  def items 
  item = Item.find(params[:id])
  render json: item, include: :user
  end

  private

  def render_not_found_message
    render json: { error: "User not found" }, status: :not_found 
  end

end
