class RatesController < ApplicationController
  def create
    @rate = current_user.rates.build rate_params
    unless @rate.save
      flash[:danger] = t "rate_not_create"
      redirect_to root_url
    end
    respond_to do |format|
      format.js
    end
  end

  private
  def rate_params
    params.require(:rate).permit :num_rate, :shop_id
  end
end
