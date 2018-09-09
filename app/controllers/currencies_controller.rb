class CurrenciesController < ApplicationController

  def new
    @currency = Currency.new
  end

  def create
    Currency.create(currency_params)
  end

  def update

  end

  private

  def currency_params
    params.require(:currency).permit(:value, :to)
  end
end
