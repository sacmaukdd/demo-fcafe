class SuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_suggestion, only: :destroy
  
  def index
    @suggestion = Suggestion.new
    @suggestions = current_user.suggestions.newest
      .paginate page: params[:page], per_page: Settings.suggestions.per_page
  end
  
  def create
    @suggestion = current_user.suggestions.new suggestion_params
    if @suggestion.save
      flash[:success] = t ".create_success"
      redirect_to suggestions_url
    else
      flash[:danger] = t ".create_error"
      render :index
    end
  end

  def destroy
    if @suggestion.destroy
      flash[:success] = t ".destroy_success"
    else
      flash[:danger] =  t ".destroy_error"
    end
    redirect_to suggestions_url
  end

  private
  def suggestion_params
    params.require(:suggestion).permit :name, :description, :image
  end

  def load_suggestion
    @suggestion = Suggestion.find_by id: params[:id]
    unless @suggestion
      flash[:danger] = t ".not_found"
      redirect_to suggestions_url
    end
  end
end
