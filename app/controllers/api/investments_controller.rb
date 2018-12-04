require 'date'

class Api::InvestmentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @investments = Investment.where(["date_of_trade = ? and date_created = ?",
                                    date_of_trade_params,
                                    date_created_params])
    render :json => @investments.to_json( :only => [:company, :quantity, :cost])
  end

  def create
    @investment = Investment.new(investment_params)
    @investment.date_created = Date.today
    if @investment.save
      render :json => @investment.to_json( :only => [:company, :quantity, :cost])
    else
      render json: @investment.errors, status: :unprocessable_entity
    end
  end

  def update
    @investment = Investment.find(params[:id])
    if @investment.update(investment_update_params)
      render :json => @investment.to_json( :only => [:company, :quantity, :cost])
    else
      render json: @investment.errors, status: :unprocessable_entity
    end
  end

  private
  def investment_params
    trade_date = {date_of_trade: Date.today}
    params.require(:investment).permit(:company,
      :quantity, :cost, :date_of_trade).reverse_merge(trade_date)
  end

  def investment_update_params
    params.require(:investment).permit(:quantity,
      :cost)
  end

  def date_of_trade_params
      params[:date_of_trade] ||= Date.today
  end

  def date_created_params
    params[:date_created] ||= Date.today
  end
end
