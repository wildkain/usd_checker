class CurrenciesController < ApplicationController
  def new
    @currency = Currency.last || Currency.new
  end

  def create
    @currency = Currency.new(currency_params)
    respond_to do |format|
      format.js do
        if @currency.save
          flash.now[:notice] = 'Currency succesfuly saved!'
          render :saved, layout: false
        else
          render :error, layout: false
        end
      end
    end
  end

  def update
    @currency = Currency.find(params[:id])
    respond_to do |format|
      format.js do
        if @currency.update(currency_params)
          flash.now[:notice] = 'Currency succesfuly saved!'
          render :saved, layout: false
        else
          render :error, layout: false
        end
      end
    end
  end

  private

  def currency_params
    params.require(:currency).permit(:value, :to)
  end
end
