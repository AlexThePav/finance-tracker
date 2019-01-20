class StocksController < ApplicationController
  # Rails 4
  # def search
  #   if params[:stock].blank?
  #     flash.now[:danger] = "You have entered an empty search string"
  #   else
  #     @stock = Stock.new_from_lookup(params[:stock])
  #     flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
  #   end
  #     render partial: 'users/result'
  # end

  # Rails 5, although above works
  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect symbol" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end
