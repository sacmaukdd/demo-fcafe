class ShopOwner::SuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_suggestion, only: [:update, :destroy]

  layout "shop_owner_layout"
  
  def index
    @supports = Supports::SuggestionSupport.new params[:page]
  end

  def update
    @suggestion.update_attributes status: params[:value]
    if @suggestion.save
      flash[:success] = t(".update_success", product: @suggestion.name, 
        status: @suggestion.status)
    else
      flash[:danger] = t(".update_error", product: @suggestion.name, 
        status: @suggestion.status)
    end
    redirect_to shop_owner_suggestions_path
  end

  def destroy
    if @suggestion.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] = t ".destroy_error"
    end
    redirect_to shop_owner_suggestions_path
  end

  private
  def load_suggestion
    @suggestion = Suggestion.find_by id: params[:id]
    unless @suggestion
      flash[:danger] = t ".not_found"
      redirect_to shop_owner_suggestions_path
    end
  end
end
