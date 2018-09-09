class CurrenciesController < ApplicationController

  def new
    @currency = Currency.last || Currency.new
  end

  def create
    @currency = Currency.new(currency_params)
    if @currency.save
      flash.now[:notice] = 'Currency succesfuly saved!'
      render :new
    else
      render :new
    end
  end

  def update
    @currency = Currency.find(params[:id])
    if @currency.update(currency_params)
      flash.now[:notice] = 'Currency succesfuly saved!'
      render :new
    else
      flash.now[:alert] = 'Currency not saved!'
      render :new
    end
  end

  private

  def currency_params
    params.require(:currency).permit(:value, :to)
  end
end
