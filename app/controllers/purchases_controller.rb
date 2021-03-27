class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :purchase_record
  before_action :user_redirection

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_address_params
    params.require(:purchase_address).permit(:postal_code, :delivery_from_id, :city, :street, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def purchase_record
    @purchase = Purchase.exists?(item_id: @item.id)
  end

  def user_redirection
    if (current_user.id == @item.user.id) || (@purchase == true)
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token],
      currency: 'jpy'
    )
  end
end
