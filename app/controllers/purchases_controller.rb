class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :user_redirection

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :delivery_from_id, :city, :street, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def user_redirection
    redirect_to root_path if current_user.id == @item.user.id
  end
end
