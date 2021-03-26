class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :all_purchases, only: [:index, :show]
  before_action :purchase_record, only: [:show,:edit, :update, :destroy]
  before_action :user_redirection, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_fee_id, :delivery_from_id,
                                 :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def all_purchases
    @purchases = Purchase.all
  end

  def purchase_record
    @purchase = Purchase.exists?(item_id: @item.id)
  end

  def user_redirection
      if (current_user.id != @item.user.id) || (@purchase == true)
        redirect_to root_path
      end
  end
end
