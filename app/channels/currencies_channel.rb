class CurrenciesChannel < ApplicationCable::Channel
  def follow
    stream_from "currencies"
  end
end
